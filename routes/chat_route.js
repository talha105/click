var express = require('express');
var Route = express.Router();
var chatController = require('../controller/chat_controller');

var router = function() {

    Route.get('/getAllGroupChat', chatController.getAllGroupChat);
    Route.get('/getUserList', chatController.getUserList);
    Route.post('/deleteChat', chatController.deleteChat);
    Route.post('/addUserInChatList', chatController.addUserInChatList);

    return Route
}

module.exports = router();