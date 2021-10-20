var express = require('express');
var Route = express.Router();
var postController = require('../controller/post_controller');

var router = function() {

    Route.post('/sendPost', postController.sendPost);
    Route.post('/getPostList', postController.getPostList);
    Route.post('/deletePost', postController.deletePost);
    Route.post('/getPostById', postController.getPostById);
    Route.post('/updatePost', postController.updatePost);
    Route.post('/getAllPost', postController.getAllPost);
    Route.post('/getSinglePostById', postController.getSinglePostById);
    Route.post('/comment', postController.comment);
    Route.post('/like', postController.like);
    Route.post('/seenPost', postController.seenPost);
    Route.post('/notifications', postController.notifications);
    Route.post('/getRandomTeamMates', postController.getRandomTeamMates);

    return Route
}

module.exports = router();