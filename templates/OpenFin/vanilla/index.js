const express = require('express');
const app = express();
const openfinLauncher = require('openfin-launcher');

app.use(express.static('public'));

let localServer = app.listen(3000, () => {
    console.log('Application hosted locally on port 3000');
    openfinLauncher.launchOpenFin({
        configPath: 'http://localhost:3000/app.json'
    }).then(() => {
        localServer.close();
    }).fail((error) => {
        console.log('Launch error: ' + error);
    });
});
