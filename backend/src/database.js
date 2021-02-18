import mongoose from 'mongoose'
const mongoose = require('mongoose');

const uri = process.env.MONGO_URI

const options = {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true
}
mongoose.Promise = global.Promise
mongoose
    .connect(uri, options)
    .then(() => {
        console.log("Conectado a MongoDB 💾")
    })
    .catch((error) => {
        console.log(error);
    })


async function connect(){
    await mongoose.connect('mongodb://localhost/digitalshop',{
        useNewUrlParser:true
    });
    console.log('Database: Connected')
}

module.exports = {connect};