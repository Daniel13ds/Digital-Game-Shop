import gameRoutes from './routes/game'
import userRoutes from './routes/user'
//import achievementRoutes from './routes/achievement'
import userController from './controllers/user'

const router = (app) => {
    app.get('/', async (req, res) => {
        res.send('Router')
    })
    app.use('/games', /*userController.validate,*/ gameRoutes)
    //app.use('/achievements', userController.validate, achievementRoutes)
    app.use('/users', userRoutes)
}

export default router