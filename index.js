const Joi = require('joi'); // Javascript Object Schema Validation
var mysql = require('mysql');
const express = require('express');
const app = express();
const oracledb = require('oracledb');
var compression = require('compression');
var helmet = require('helmet');
app.use(helmet());
app.use(express.json());
app.use(compression());
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

app.get('/api/users', (req, res) => {
	oracledb.getConnection(config, function(err, connection) {
		if (err) throw err;
		connection.execute('select * from USERS_TT', {}, { outFormat: oracledb.OBJECT }, function(err, rows) {
			if (err) throw err;
			res.send(rows.rows);
		});
	});
});

app.post('/api/users', (req, res) => {
	const result = validateCourse(req.body);
	if (result.error) return res.status(400).send(result.error);

	const user = {
		firstName: req.body.firstName,
		lastName: req.body.lastName,
		userName: req.body.userName,
		password: req.body.password
	};
	conn.query(
		"INSERT INTO `User` (`id`, `firstName`, `lastName`, `username`, `password`) VALUES (NULL, '" +
			req.body.firstName +
			"', '" +
			req.body.lastName +
			"', '" +
			req.body.userName +
			"', '" +
			req.body.password +
			"')",
		function(err, result) {
			if (err) throw err;

			console.log('1 record inserted');
			res.send(user);
		}
	);
});
function validateCourse(course) {
	const schema = {
		// name: Joi.string().min(3).required()
		firstName: Joi.string().min(3).required(),
		lastName: Joi.string().min(3).required(),
		userName: Joi.required(),
		password: Joi.required()
	};
	return Joi.validate(course, schema);
}

app.listen(port, () => console.log(`Listening on port ${port}!`));
