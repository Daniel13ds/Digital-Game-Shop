import User from '../models/user'
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'

const userController = {
    registerUser : async (req, res) => {
        const { body } = req
        try {
            const userNew = await User.create(body)
            res
                .status(201)
                .json(userNew)
        } catch (error) {
            res 
                .status(400)
                .json({error: error})
        }
    },
    getUsers: async (req, res) => {
        try {
            const users = await User.find()
            res
                .status(200)
                .json(users)
        } catch (error) {
            res 
                .status(400)
                .json({error: error})
        }
    },
    getUserById: async (req, res) => {
        const _id  = req.params.id
        try {
            const user = await User.findById(_id)
            res
                .status(200)
                .json(user)
        } catch (error) {
            res 
                .status(500)
                .json({error: error})
        }
    },
    deleteUserByID:async (req,res) =>{
        const _id  = req.params.id
        try {
            const user = await User.findByIdAndDelete(_id)
            res
                .status(200)
                .json(user)
        } catch (error) {
            res 
                .status(500)
                .json({error: error})
        }

    },
    updateUserById: async (req, res) => {
        const _id = req.params.id
        const { body } = req
        try {
            const user = await User.findByIdAndUpdate(
                _id,
                body,
            )
            if (!user) {
                res 
                    .status(404)
                    .json({error: "no existe el usuario"})
            }
            res
                .status(200)
                .json( {message: "actualización correcta" })
        } catch (error) {
            res 
                .status(500)
                .json({error: "Error de servidor"})
        }
    },
    loginUser : async (req, res) => {
        console.log('en longin')
        
        const { body } = req 
        console.log(body)
        try {
            const user = await User.findOne({username: body.username})
            if (!user) { 
                res 
                    .status(400)
                    .json({error: 'not valid user'})
                throw new Error()
            }
            const validUser = await bcrypt.compare(body.password + "", user.password + "") 
            if (validUser){
                const token = jwt.sign({_id: user._id }, process.env.JWT_KEY,
                    { expiresIn: '1h' })
                res
                    .status(200)
                    .json({message: 'valid user', token: token})
            } else { 
                res 
                    .status(400)
                    .json({error: 'not valid password'})
            }
           
        } catch (error) {
            console.log(error)
        }
    },
    validate: async (req, res, next) => {
        const token = req.headers['x-access-token']
        try {
            if (!token) {
                res 
                .status(400)
                .json({error: 'no hay token'})
                throw new Error()
            }
            jwt.verify(token, process.env.JWT_KEY, function(err, decoded) {
                if (err) {
                    res 
                        .status(400)
                        .json({error: 'token incorrecto'})
                    throw new Error()
                }
                next()
            }) 

        } catch (error) {
            console.log(error)
            
        }
    }
}

export default userController