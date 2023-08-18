const mongoose= require('mongoose')
 module.exports= mongoose.model('objectif',{
 id_obj :{type:Number},
 extension:{type:Number},
 preuve:{type:String},
 ref_obj:{type:Number},
 date:{type:date},
 quantité:{type:Number}
})
