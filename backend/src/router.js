import gameRoutes from './routes/game'
import userRoutes from './routes/user'
import rewardRoutes from './routes/reward'

const router = (app) => {
    app.get('/', async (req, res) => {
        res.send('Router')
    })
    app.use('/games', /*userController.validate,*/ gameRoutes)
    app.use('/rewards', /*userController.validate,*/ rewardRoutes)
    app.use('/users', userRoutes)
}

export default router