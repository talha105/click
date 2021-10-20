var express = require('express');
var Route = express.Router();
var scoreController = require('../controller/score_controller');

var router = function() {

    Route.get('/getSports', scoreController.getSports);
    Route.get('/getScore1', scoreController.getScore1);
    Route.get('/sports', scoreController.rSports);
    Route.post('/getSportDetailsById', scoreController.getSportDetailsById);

    return Route
}

module.exports = router();