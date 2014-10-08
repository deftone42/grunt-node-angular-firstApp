// set up ======================================================================
var express  = require('express');
var app      = express();
var fs 		 = require('fs');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var morgan = require('morgan');

// Connect to mongodb ==========================================================
var connect = function () {
  var options = { server: { socketOptions: { keepAlive: 1 } } };
  mongoose.connect('mongodb://localhost/firstApp', options);
};

mongoose.connection.on('error', console.log);
mongoose.connection.once('open', function callback () {
  console.log('Mongodb connect successfully');
});

connect();

// application settings=========================================================
app.use(express.static(__dirname + '/public'));
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));
app.use(methodOverride());

// routes ======================================================================
app.get('/', function(req, res) {
	res.sendfile('./public/index.html');
});

// models ======================================================================
fs.readdirSync(__dirname + '/server/models').forEach(function (file) {
  if (~file.indexOf('.js')) require(__dirname + '/server/models/' + file);
});

// controllers =================================================================
var controllers_path = __dirname + '/server/controllers'
  , controller_files = fs.readdirSync(controllers_path)
controller_files.forEach(function (file) {
  require(controllers_path+'/'+file)(app)
})

// listen (start app with node server.js) ======================================
app.listen(process.env.PORT || 8080);
console.log("App listening on port 8080");

module.exports = app