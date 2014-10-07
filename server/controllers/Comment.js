var mongoose = require('mongoose')
var Comment = mongoose.model('comment')

module.exports = function(app){
	// get all comments
	app.get('/api/comment', function(req, res) {
		Comment.find(function(err, comments) {
			if (err)
				res.send(err)
			res.json(comments);
		});
	});

	// Create a comment
	app.post('/api/comment', function(req, res) {
		Comment.create({
			article_id: req.body.article_id,
		    nick: req.body.nick,
			comment: req.body.comment
		}, function(err, comment) {
			if (err)
				console.log('Error!! comment not created');

			// get and return all the comments after you create another
			Comment.find(function(err, comments) {
				if (err)
					console.log('Error!! comments not found');
				res.json(comments);
			});
		});
	});
};