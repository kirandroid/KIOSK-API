const Joi = require("joi"); // Javascript Object Schema Validation
const express = require("express");
const app = express();
const oracledb = require("oracledb");
var compression = require("compression");
const fileUpload = require("express-fileupload");
var helmet = require("helmet");
app.use(helmet());
app.use(express.json());
app.use(compression());
const path = require("path");
var bodyParser = require("body-parser");
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
const port = process.env.PORT || 3000;
oracledb.autoCommit = true;

const config = {
  user: "root",
  password: "root",
  connectString: "localhost:1521/xe"
};
app.get("/", (req, res) =>
  res.send(
    'This is main page of KIOSK API. Try the "/api/users" endpoint to get started!'
  )
);

//images stored in uploads folder is served through - http://localhost:4000/images/<imagename>
app.use("/images", express.static(__dirname + "/uploads/"));

app.use(fileUpload());

app.post("/api/upload", function(req, res) {
  if (Object.keys(req.files).length == 0) {
    return res.status(400).send("No files were uploaded.");
  }
  console.log(req);

  let imageFile = req.files.imageFile;

  imageFile.mv(__dirname + "/uploads/" + imageFile.name, function(err, result) {
    if (err) return res.status(500).send(err);

    res.send({
      status: "Success yo!",
      url: "http://kioskapi.tk:4000/images/" + imageFile.name
    });
  });
});

app.get("/api/events", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from EVENT",
      {},
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) return res.status(500).send(err);
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/selectevents", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from EVENT WHERE EVENT_ID = :EVENTID",
      [req.query.eventId],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) return res.status(500).send(err);
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/users", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from USERS",
      {},
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/selectUsers", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from USERS WHERE USER_ID = :USERID",
      [req.query.id],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/checkBookedEvent", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from BOOKING WHERE EVENT_ID = :EVENTID AND USER_ID = :USERID",
      [req.query.eventid, req.query.userid],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else if (result.rows <= 0) {
          res.send({
            hasBooked: false
          });
        } else {
          res.send({
            hasBooked: true
          });
        }
      }
    );
  });
});

app.get("/api/checkstudent", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from STUDENT WHERE STUDENT_ID = :STUDENTID AND AVAILABLE = 1",
      [req.query.studentid],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else if (result.rows <= 0) {
          res.send({
            isAvail: false
          });
        } else {
          res.send({
            isAvail: true
          });
        }
      }
    );
  });
});

app.get("/api/activity", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from ACTIVITY WHERE ACT_TYPE = :ACTTYPE",
      [req.query.type],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/service", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from SERVICE WHERE SER_TYPE = :SERTYPE",
      [req.query.type],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/community", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from COMMUNITY",
      {},
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/bookings", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from EVENT, USERS, BOOKING WHERE EVENT.EVENT_ID = BOOKING.EVENT_ID AND USERS.USER_ID = :USERID",
      [req.query.userId],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/allbookings", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) throw err;
    connection.execute(
      "select * from EVENT, USERS, BOOKING WHERE EVENT.EVENT_ID = BOOKING.EVENT_ID AND BOOKING.USER_ID = USERS.USER_ID",
      [],
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) {
          console.log(err);
        }
        res.send(rows.rows);
      }
    );
  });
});

app.get("/api/featured_home_slider", (req, res) => {
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from F                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  EATURED_HOME_SLIDER",
      {},
      { outFormat: oracledb.OBJECT },
      function(err, rows) {
        if (err) throw err;
        res.send(rows.rows);
      }
    );
  });
});

app.post("/api/login", (req, res) => {
  //   const result = validateLogin(req.body);
  //   if (result.error) return res.status(400).send(result.error);

  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
    }
    connection.execute(
      "select * from USERS WHERE STUDENT_ID = :USER_ID AND PASSWORD = :USER_PASS",
      [req.body.STUDENT_ID, req.body.PASSWORD],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else if (result.rows <= 0) {
          res.status(204).send({
            status: "404",
            Message: "Invalid Student ID or Password!"
          });
        } else {
          res.status(200).send(result.rows);
        }
      }
    );
  });
});

app.post("/api/register", (req, res) => {
  // const result = validateLogin(req.body);
  // if (result.error) return res.status(400).send(result.error);
  res.setHeader("Content-Type", "application/json");
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    connection.execute(
      "INSERT INTO USERS (FIRST_NAME, LAST_NAME, USERNAME, PASSWORD, EMAIL, CREATED_AT, STUDENT_ID, UPDATED_AT, ROLE, STUDY_LEVEL, COURSE, CONTACT, GENDER) VALUES(:FNAME, :LNAME, :UNAME, :PASSER, :UEMAIL, :CREATEDAT, :STDID, :UPDATEDAT, :ROLE, :STUDYLVL, :COURSE, :CONTACT, :GENDER)",
      [
        req.body.FIRST_NAME,
        req.body.LAST_NAME,
        req.body.USERNAME,
        req.body.PASSWORD,
        req.body.EMAIL,
        req.body.CREATED_AT,
        req.body.STUDENT_ID,
        req.body.UPDATED_AT,
        req.body.ROLE,
        req.body.STUDY_LEVEL,
        req.body.COURSE,
        req.body.CONTACT,
        req.body.GENDER
      ],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

app.post('/api/addnewsnotice', (req, res) => {
	res.setHeader('Content-Type', 'application/json');
	oracledb.getConnection(config, function(err, connection) {
		if (err) {
			console.log(err);
			res.sendStatus(500);
			return;
		}
		console.log(req);

		connection.execute(
			'INSERT INTO NEWSNOTICE (NN_TITLE, NN_DESC, CREATED_AT, UPDATED_AT, ACTIVE, TYPE) VALUES( :NNTITLE, :NNDESC, :CREATEDAT, :UPDATEDAT, :NNACTIVE, :NNTYPE)',
			[
				req.body.NN_TITLE,
				req.body.NN_DESC,
				req.body.CREATED_AT,
				req.body.UPDATED_AT,
				req.body.ACTIVE,
				req.body.TYPE
			],
			{ outFormat: oracledb.OBJECT },
			function(err, result) {
				if (err) {
					res.send(err);
				} else {
					res.status(200).send({ Status: 'success' });
				}
			}
		);
	});
});

app.get('/api/newsnotice', (req, res) => {
	oracledb.getConnection(config, function(err, connection) {
		if (err) {
			console.log(err);
		}
		connection.execute('select * from NEWSNOTICE WHERE ACTIVE = 1', {}, { outFormat: oracledb.OBJECT }, function(
			err,
			rows
		) {
			if (err) throw err;
			res.send(rows.rows);
		});
	});
});

app.post('/api/addactivity', function(req, res) {
	if (Object.keys(req.files).length == 0) {
		return res.status(400).send('No files were uploaded.');
	}
	console.log(req);

	let imageFile = req.files.imageFile;

	const randomNumber = Math.floor(Math.random() * 9999999999);
	imageFile.mv(__dirname + '/uploads/' + randomNumber + imageFile.name, function(err, result) {
		if (err) return res.status(500).send(err);

		console.log('http://kioskapi.tk:4000/images/' + randomNumber + imageFile.name);
	});

	res.setHeader('Content-Type', 'application/json');
	oracledb.getConnection(config, function(err, connection) {
		if (err) {
			console.log(err);
			res.sendStatus(500);
			return;
		}
		connection.execute(
			'INSERT INTO ACTIVITY (ACT_NAME, ACT_IMAGE, ACT_DESCRIPTION, ACT_TYPE) VALUES(:ACTNAME, :ACTIMAGE, :ACTDESC, :ACTYPE)',
			[
				req.body.ACT_NAME,
				'http://kioskapi.tk:4000/images/' + imageFile.name,
				req.body.ACT_DESCRIPTION,
				req.body.ACT_TYPE
			],
			{ outFormat: oracledb.OBJECT },
			function(err, result) {
				if (err) {
					res.send(err);
				} else {
					res.status(200).send({ Status: 'success' });
				}
			}
		);
	});
});

app.post("/api/bookevent", function(req, res) {
  res.setHeader("Content-Type", "application/json");
  console.log(req);

  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    connection.execute(
      "INSERT INTO BOOKING (BOOKED_DATE, EVENT_ID, USER_ID) VALUES(:BOOKDATE, :EVENTID, :USERID)",
      [req.body.BOOK_DATE, req.body.EVENT_ID, req.body.USER_ID],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

app.put("/api/updateSeat", (req, res) => {
  var seatLeft = req.body.SEAT_LEFT;

  res.setHeader("Content-Type", "application/json");
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    connection.execute(
      `UPDATE EVENT SET SEAT_LEFT = :SEATLEFT WHERE EVENT_ID = :EVENTID`,
      [seatLeft - 1, req.body.EVENT_ID],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        console.log(err);
        console.log(result);

        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

app.post("/api/addservice", function(req, res) {
  if (Object.keys(req.files).length == 0) {
    return res.status(400).send("No files were uploaded.");
  }
  console.log(req);

  let imageFile = req.files.imageFile;
  const randomNumber = Math.floor(Math.random() * 9999999999);
  imageFile.mv(
    __dirname + "/uploads/" + randomNumber + imageFile.name,
    function(err, result) {
      if (err) return res.status(500).send(err);

      console.log(
        "http://localhost:3000/images/" + randomNumber + imageFile.name
      );
    }
  );

  res.setHeader("Content-Type", "application/json");
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    connection.execute(
      "INSERT INTO SERVICE (SER_NAME, SER_IMAGE, SER_DESCRIPTION, SER_TYPE) VALUES(:ACTNAME, :ACTIMAGE, :ACTDESC, :ACTYPE)",
      [
        req.body.SER_NAME,
        "http://kioskapi.tk:4000/images/" + imageFile.name,
        req.body.SER_DESCRIPTION,
        req.body.SER_TYPE
      ],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

app.post("/api/addevent", (req, res) => {
  if (Object.keys(req.files).length == 0) {
    return res.status(400).send("No files were uploaded.");
  }
  console.log(req);

  let imageFile = req.files.IMAGE_URL;
  const randomNumber = Math.floor(Math.random() * 9999999999);
  imageFile.mv(
    __dirname + "/uploads/" + randomNumber + imageFile.name,
    function(err, result) {
      if (err) return res.status(500).send(err);

      console.log(
        "http://localhost:3000/images/" + randomNumber + imageFile.name
      );
    }
  );

  res.setHeader("Content-Type", "application/json");
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    console.log(req);

    connection.execute(
      "INSERT INTO EVENT (TITLE, IMAGE_URL, DESCRIPTION, SEAT_NUMBER, CREATED_AT, UPDATED_AT, EVENT_DATE, EVENT_TYPE, EVENT_STATUS, EVENT_END_DATE, SEAT_LEFT) VALUES(:ETITLE, :EIMAGEURL, :EDESCRIPTION, :ESEAT, :ECREATEDAT, :EUPDATEDAT, :EVENTDATE, :EVENTTYPE, :EVENTSTATUS, :EVENTENDDATE, :SEATLEFT)",
      [
        req.body.TITLE,
        "http://localhost:3000/images/" + randomNumber + imageFile.name,
        req.body.DESCRIPTION,
        req.body.SEAT_NUMBER,
        req.body.CREATED_AT,
        req.body.UPDATED_AT,
        req.body.EVENT_DATE,
        req.body.EVENT_TYPE,
        req.body.EVENT_STATUS,
        req.body.EVENT_END_DATE,
        req.body.SEAT_LEFT
      ],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        console.log(err);
        console.log(result);

        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

app.put("/api/updateProfile", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  oracledb.getConnection(config, function(err, connection) {
    if (err) {
      console.log(err);
      res.sendStatus(500);
      return;
    }
    connection.execute(
      "UPDATE USERS SET FIRST_NAME = :FNAME, LAST_NAME = :LNAME, USERNAME = :UNAME, EMAIL= :UEMAIL, STUDY_LEVEL = :STUDYLEVEL, COURSE = :COURSE, CONTACT = :CONTACT, GENDER = :GENDER, UPDATED_AT= :UPDATEDAT WHERE USER_ID = :UserID",
      [
        req.body.FIRST_NAME,
        req.body.LAST_NAME,
        req.body.USERNAME,
        req.body.EMAIL,
        req.body.STUDY_LEVEL,
        req.body.COURSE,
        req.body.CONTACT,
        req.body.GENDER,
        req.body.UPDATED_AT,
        req.body.USERID
      ],
      { outFormat: oracledb.OBJECT },
      function(err, result) {
        console.log(err);
        console.log(result);

        if (err) {
          res.send(err);
        } else {
          res.status(200).send({ Status: "success" });
        }
      }
    );
  });
});

function validateLogin(creds) {
  const schema = {
    USERNAME: Joi.required(),
    PASSWORD: Joi.required()
  };
  return Joi.validate(creds, schema);
}

app.listen(port, () => console.log(`Listening on port ${port}!`));
