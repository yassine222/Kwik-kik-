const mongoose= require('mongoose')
 module.exports= mongoose.model('post',{
 id_post :{type:Number,},
 contenu:{type:String},
 titre:{type:String},
 date:{type:date}
})
