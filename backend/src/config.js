import cors from 'cors'
import bodyParser from 'body-parser'
import morgan from 'morgan'

const config = (app) => {
    app.disable('x-powered-by')
    app.use(bodyParser.json())
    app.use(bodyParser.urlencoded({ extended: false }))
    app.use(cors())
    app.use(morgan('dev'))
}

export default config