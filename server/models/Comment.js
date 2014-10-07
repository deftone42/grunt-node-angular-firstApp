var mongoose = require('mongoose');
var Article = mongoose.model('article')

var commentSchema = new mongoose.Schema({
    article_id : { type: Number },
    nick : { type : String, trim : true },
    comment: { type : String, trim : true }
});
mongoose.model('comment', commentSchema);