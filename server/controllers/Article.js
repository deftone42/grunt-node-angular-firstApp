var mongoose = require('mongoose')
var Article = mongoose.model('article')

module.exports = function(app){
	// get all articles
	app.get('/api/article', function(req, res) {
		Article.find(function(err, articles) {
			if (err)
				res.send(err)

			res.json(articles);
		});
	});

	app.get('/api/article/:article_id', function(req, res) {
		Article.find({
			_id : req.params.article_id
		}, function(err, article) {
			if (err)
				res.send(err);
			
			res.json(article);
		});
	});

	// Create a article
	app.post('/api/article', function(req, res) {
		object = validate(req.body);

		if(object.valid){
			Article.create({
				nick: object.nick,
			    title: object.title,
				content: object.content,
			    tags: object.tags,
			}, function(err, article) {
				if (err)
					console.log('Error!! Article not created');

				// get and return all the Articles after you create another
				Article.find(function(err, articles) {
					if (err)
						console.log('Error!! Articles not found');
					res.json(articles);
				});
			});
		}
	});

	// delete an article
	app.delete('/api/article/:article_id', function(req, res) {
		Article.remove({
			_id : req.params.article_id
		}, function(err, article) {
			if (err)
				res.send(err);

			Article.find(function(err, articles) {
				if (err)
					res.send(err)
				res.json(articles);
			});
		});
	});

	// Validate data in post method
	function validate(model) {
		var valid = true;
		var object = {};

		if(model.title == undefined || model.content == undefined){
			valid = false;
		}

		if(valid){
			object.title = model.title;
			object.content = model.content;
			object.tags = model.tags;
			object.nick = model.nick;
			object.valid = true;
		}

		return object
	}
};