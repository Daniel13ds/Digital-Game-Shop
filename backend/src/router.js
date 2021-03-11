import gameRoutes from './routes/game'
import userRoutes from './routes/user'
import rewardRoutes from './routes/reward'
import userController from './controllers/user'

const router = (app) => {
    app.get('/', async (req, res) => {
        res.send('Router')
    })
    app.use('/games',  gameRoutes)
    app.use('/rewards',  rewardRoutes)
    app.use('/users', userRoutes)
}

export default router