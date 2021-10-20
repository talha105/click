'user strict';
var sql = require('../config');
var commonServices = require('../commonServices/common');
var chatService = require('../dataServices/chat_services');

var formidable = require('formidable');
const fs = require("fs");
const path = require("path");

exports.getAllGroupChat = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        chatService.getAllGroupChat(userId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })
            return res.json({
                status: 1,
                data: result,
                msg: "Data featch successfully."
            })
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.getUserList = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        chatService.getUserList(userId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })
            return res.json({
                status: 1,
                data: result,
                msg: "Data featch successfully."
            })
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.deleteChat = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        chatService.deleteChat(userId, req.body.chatId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })
            return res.json({
                status: 1,
                data: result,
                msg: "Deleted successfully."
            })
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.addUserInChatList = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        chatService.addUserInChatList(req.body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })
            return res.json({
                status: 1,
                data: result,
                msg: "Deleted successfully."
            })
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}