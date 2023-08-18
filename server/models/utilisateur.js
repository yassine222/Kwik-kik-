const mongoose= require('mongoose')
 module.exports= mongoose.model('utilisateur',{
 id_utilisateur :{type:Number},
 nom_utilisateur:{type:String},
 prenom_utilisateur:{type:String},
 mot_pass_utilisateur:{type:String},
 Email:{type:String},
 age:{type:Number},
 sexe:{type:String},
 adress:{type:String},
 date_naissance:{type:date}
}) 
