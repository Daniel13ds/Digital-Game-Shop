import mongoose, { mongo } from 'mongoose'
import validator from 'validator'

const Schema = mongoose.Schema

const RewardSchema = new Schema({
    icon: {
        type: String,
        required: true,
        unique: true
    },
    name: {
        type: String,
        required: true,
        unique: false,
        trim: true
    },
    description: {
        type: String,
        required: true,
        unique: false,
        trim: true
    },
    difficulty: {
        type: String,
        required: true,
        unique: false,
        trim: true
    },
    earned: {
        type: Boolean,
        required: true,
        unique: false,
        default: false
    },
    global_statistic: {
        type: Number,
        required: true,
        unique: false,
        default: 0
    },
    game_id: {
        type: String,
        required: true,
        unique: false
    }
}, { versionKey: false })

const Reward = mongoose.model('Reward', RewardSchema)

export default Reward