import express from 'express'
import userController from '../controllers/user'

const userRoutes = express.Router()

userRoutes.post('/register', userController.registerUser)
userRoutes.post('/login', userController.loginUser)
userRoutes.get('/', userController.validate, userController.getUsers)
userRoutes.get('/:id', userController.validate, userController.getUserById)
userRoutes.delete('/:id', userController.validate, userController.deleteUserByID)
userRoutes.put('/:id', userController.validate, userController.updateUserById)

export default userRoutes