const mongoose= require('mongoose')
 module.exports= mongoose.model('profil',{
 id_profil :{type:Number},
 poids:{type:Number},
 age:{type:Number},
 taille:{type:Number}
})