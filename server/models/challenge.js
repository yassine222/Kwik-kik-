const mongoose= require('mongoose')
const objectif = require('./objectif')
 module.exports= mongoose.model('challenge',{
 idchallenge :{type:Number},
 listeobjectif:{type:NodeList},
 titre_objectif:{type:String},
 Montant:{type:Number},
 duree:{type:Number},
 quantite_totale:{type:Number}
})
