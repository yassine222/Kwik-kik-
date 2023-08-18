const mongoose= require('mongoose')
 module.exports= mongoose.model('questions',{
 Id_question :{type:Number},
 contenu:{type:String},
 reference:{type:String},
})