import express from 'express'
import userController from '../controllers/user'

const userRoutes = express.Router()

userRoutes.post('/register', userController.registerUser)
userRoutes.post('/login', userController.loginUser)
userRoutes.get('/', userController.getUsers)
userRoutes.get('/:id',  userController.getUserById)
userRoutes.delete('/:id', userController.deleteUserByID)
userRoutes.put('/:id', userController.updateUserById)

export default userRoutes