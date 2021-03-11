import 'core-js/stable'
import 'regenerator-runtime/runtime'
import express from 'express'
import config from './config'
import router from './router'
import './database'



const PORT = process.env.PORT || 5000
const app = express()
config(app)
router(app)

app.listen(PORT, () => console.log(`El servidor ha sido inicializado: http://localhost:${PORT}`))