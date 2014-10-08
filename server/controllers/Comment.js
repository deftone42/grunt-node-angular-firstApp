var mongoose = require('mongoose')
var Comment = mongoose.model('comment')

module.exports = function(app){
	// get all comments
	app.get('/api/comment/:article_id', function(req, res) {
		Comment.find({
			article_id: req.params.article_id
		}, function(err, comments) {
			if (err)
				res.send(err);

			res.json(comments);
		});
	});

	// Create a comment
	app.post('/api/comment', function(req, res) {
		object = validate(req.body);

		if(object.valid){
			Comment.create({
				article_id: object.article_id,
			    nick: object.nick,
				comment: object.comment
			}, function(err, comment) {
				if (err)
					console.log('Error!! comment not created');

				// get and return all the comments after you create another
				Comment.find({
					article_id: comment.article_id
				}, function(err, comments) {
					if (err)
						res.send(err);
					console.log(comments);

					res.json(comments);
				});
			});
		}
	});

	// delete a comment
	app.delete('/api/comment', function(req, res) {
		Comment.remove(function(err, comments) {
			if (err)
				res.send(err);

			res.json(comments);
		});
	});

	// Validate data in post method
	function validate(model) {
		var valid = true;
		var object = {};

		if(model.nick == undefined || model.comment == undefined){
			valid = false;
		}

		if(valid){
			object.article_id = model.article_id;
			object.comment = model.comment;
			object.nick = model.nick;
			object.valid = true;
		}

		return object
	}
};