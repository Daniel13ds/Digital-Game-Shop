import mongoose, { mongo } from 'mongoose'
import validator from 'validator'

const Schema = mongoose.Schema

const GameSchema = new Schema({
    logo: {
        type: String,
        required: true,
        unique: true
    },
    title: {
        type: String,
        required: true,
        unique: false,
        trim: true
    },
    description: {
        type: String,
        required: false,
        unique: false,
        trim: true
    },
    distributor: {
        type: String,
        required: true,
        unique: false
    },
    date: {
        type: String,
        required: true,
        unique: false,
        trim: true/*,
        validate: value => {
            if (!validator.isDate(value)) {
                throw new Error({error: 'Invalid Date'})
            }
        }*/
    },
    price: {
        type: Number,
        required: true,
        unique: false
    },
    personal_score: {
        type: Number,
        required: false,
        unique: false
    },
    global_score: {
        type: Number,
        required: false,
        unique: false
    },
    progress: {
        type: Number,
        required: false,
        unique: false
    },
    user_id: {
        type: Array,
        required: false,
        unique: false
    }
}, { versionKey: false })

const Game = mongoose.model('Game', GameSchema)

export default Game