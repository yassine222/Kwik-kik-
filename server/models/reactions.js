const mongoose= require('mongoose')
 module.exports= mongoose.model('reactions',{
 id_reaction :{type:Number},
 type:{type:String},
 date:{type:date},
})