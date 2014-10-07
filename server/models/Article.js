var mongoose = require('mongoose');
var articleSchema = new mongoose.Schema({
    nick : { type : String, trim : true, index : true },
    tags: { type : String, trim : true },
    title: { type : String, trim: true },
    content: { type : String, trim : true }
});
mongoose.model('article', articleSchema);