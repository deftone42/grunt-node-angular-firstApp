var mongoose = require('mongoose');
var Article = mongoose.model('article')

var commentSchema = new mongoose.Schema({
    article_id : { type: String, trim : true },
    nick : { type : String, trim : true },
    comment: { type : String, trim : true }
});
mongoose.model('comment', commentSchema);