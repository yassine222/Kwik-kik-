const mongoose= require('mongoose')
 module.exports= mongoose.model('recommendations_livres',{
 id_livre :{type:String},
 titre:{type:String}
})
 