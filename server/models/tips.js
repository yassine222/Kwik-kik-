const mongoose= require('mongoose')
 module.exports= mongoose.model('tips',{
 id_conseil :{type:Number},
 texte:{type:String}
})

