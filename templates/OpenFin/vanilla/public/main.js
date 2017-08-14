/* global fin */
document.addEventListener('DOMContentLoaded', () => {
    const ofVersion = document.getElementById('no-openfin');
    if (typeof fin !== 'undefined') {
        init();
    } else {
        ofVersion.innerText = 'OpenFin is not available - you are probably running in a browser.';
    }
});

function init () {
    fin.desktop.System.getVersion(version => {
        console.log(version);
    });
}
