const express = require('express')
const app = express()
const port = 3000
const dotenv = require('dotenv');
const mongoose  = require('mongoose');


dotenv.config();
mongoose.connect(process.env.DB_URL)
.then(()=> console.log('db connected'))
.catch((err)=> { console.log(err)});




app.get('/', (req, res) => res.send('Hello World!'))
app.listen(process.env.PORT || 3001 , () => console.log(`Example app listening on port ${port}!`))