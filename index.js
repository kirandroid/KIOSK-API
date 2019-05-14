const Joi = require('joi'); // Javascript Object Schema Validation
const express = require('express');
const app = express();
const oracledb = require('oracledb');
var compression = require('compression');
const fileUpload = require('express-fileupload');
var helmet = require('helmet');
app.use(helmet());
app.use(express.json());
app.use(compression());
const path = require('path');
var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
const port = process.env.PORT || 4000;

const config = {
	user: 'root',
	password: 'root',
	connectString: 'localhost:1521/xe'
};
app.get('/', (req, res) => res.send('This is main page of KIOSK API. Try the "/api/users" endpoint to get started!'));

//images stored in uploads folder is served through - http://localhost:4000/images/<imagename>
app.use('/images', express.static(__dirname + '/uploads/'));

app.use(fileUpload());

app.post('/api/upload', function(req, res) {
	if (Object.keys(req.files).length == 0) {
		return res.status(400).send('No files were uploaded.');
	}
	let imageFile = req.files.imageFile;

	imageFile.mv(__dirname + '/uploads/' + imageFile.name, function(err, result) {
		if (err) return res.status(500).send(err);

		res.send({
			status: 'Success yo!',
			url: 'http://kioskapi.tk:4000/images/' + imageFile.name
		});
	});
});

app.get('/api/users', (req, res) => {
	oracledb.getConnection(config, function(err, connection) {
		if (err) throw err;
		connection.execute('select * from USERS', {}, { outFormat: oracledb.OBJECT }, function(err, rows) {
			if (err) throw err;
			res.send(rows.rows);
		});
	});
});

app.get('/api/featured_home_slider', (req, res) => {
	oracledb.getConnection(config, function(err, connection) {
		if (err) throw err;
		connection.execute('select * from FEATURED_HOME_SLIDER', {}, { outFormat: oracledb.OBJECT }, function(
			err,
			rows
		) {
			if (err) throw err;
			res.send(rows.rows);
		});
	});
});

app.post('/api/login', (req, res) => {
	const result = validateLogin(req.body);
	if (result.error) return res.status(400).send(result.error);

	oracledb.getConnection(config, function(err, connection) {
		if (err) throw err;
		connection.execute(
			'select * from USERS WHERE USERNAME = :USER_ID AND PASSWORD = :USER_PASS',
			[ req.body.USERNAME, req.body.PASSWORD ],
			{ outFormat: oracledb.OBJECT },
			function(err, rows) {
				if (rows.length > 0) {
					res.send(rows.rows);
				} else {
					res.send(err);
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
