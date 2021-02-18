import mongoose from 'mongoose'
import validator from 'validator'
import bcrypt from 'bcrypt'

const Schema = mongoose.Schema

const UserSchema = new Schema({
    avatar:{
        type:String,
        required:false,
    },
    name:{
        type:String,
        required:true,
        trim:true
    },
    lastname:{
        type:String,
        required:true,
        trim:true
    },
    username:{
        type:String,
        required:true,
        trim:true,
        unique:true
    },
    email:{
        type:String,
        required:true,
        unique:true,
        validate: value => {
            if (!validator.isEmail(value)) {
               throw new Error({error: 'Invalid Email'})
            }
        }
    },
    password:{
        type:String,
        required:true,
        minlength: 5
    },
    gamelist:{
        type:Array,
        required:false,
        trim:true
    },
    
},{versionKey:false})

UserSchema.pre('save', async function (next){

    try {
        this.password = await bcrypt.hash(this.password, 10)
    } catch (error) {
        console.log(error);
    }
    next()

})

const User = mongoose.model('User', UserSchema)

export default User