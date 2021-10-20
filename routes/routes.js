const express = require('express');
const app = express();

var userRoutes = require('./user_route');
var socialRoutes = require('./social_route');
var chatRoutes = require('./chat_route');
var scoreRoutes = require('./score_route');

app.use('/user', userRoutes);
app.use('/social', socialRoutes);
app.use('/chat', chatRoutes);
app.use('/score', scoreRoutes);

module.exports = app;