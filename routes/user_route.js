var express = require('express');
var Route = express.Router();
var userController = require('../controller/user_controller');

var router = function() {

    Route.post('/login', userController.login);
    Route.post('/signup', userController.signup);
    Route.get('/profile', userController.profile);
    Route.post('/updateProfile', userController.updateProfile);
    Route.post('/forgotPassword', userController.forgotPassword);
    Route.post('/verifyChangePassword', userController.verifyChangePassword);
    Route.post('/socialSignInSignUp', userController.socialSignInSignUp);
    Route.post('/getAllUserForAdmin', userController.getAllUserForAdmin);
    Route.post('/updateUserRollBySuperAdmin', userController.updateUserRollBySuperAdmin);
    Route.post('/otp', userController.otp);
    Route.post('/verifyOtp', userController.verifyOtp);
    return Route
}

module.exports = router();