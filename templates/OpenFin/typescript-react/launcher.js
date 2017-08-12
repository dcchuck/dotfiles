const express = require('express')
const openfinLauncher = require('openfin-launcher')

const app = express()

app.use(express.static('dist'))

let localApp = app.listen(3000, () => {
    openfinLauncher.launchOpenFin({
        configPath: 'http://localhost:3000/app.json'
    }).then(() => {
        localApp.close()
    }).fail((error) => {
        console.log('Launch error: ' + error)
    })
})