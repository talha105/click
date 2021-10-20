common = module.exports = {};
var sql = require('../config');
const nodemailer = require("nodemailer");

common.required = function(value) {
    var result = false;
    if (value != '' && value != undefined && value != null) result = true;
    return result;
}

common.stringGen = function() {
    var text = "";
    var len = 50;
    var char_list =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (var i = 0; i < len; i++) {
        text += char_list.charAt(Math.floor(Math.random() * char_list.length));
    }
    return text;
}

common.checkURLOfImage = function(url) {
    return (url.match(/\.(jpeg|jpg|gif|png)$/) != null);
}

common.validateEmail = function(email) {
    const re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    return re.test(email);
}

common.validateEmail = function(email) {
    const re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    return re.test(email);
}

common.validatePassword = function(pass) {
    if (pass.length < 6) return false;
}

common.validatePhoneNumber = function(number) {

    var num = /^[0-9]\d*$/g;

    if (number.match(num)) {
        return false;
    } else {
        return true;
    }
}

common.getUserIdByToken = function(req, res) {
    return new Promise(resolve => {
        var token = req.headers.authorization;
        sql.query(`select * from session where session = '${token}'`, (error, sessionResult) => {
            console.log(error);
            if (error) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult.length == 0) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult[0].user_id) {
                resolve(sessionResult[0].user_id);
            } else return res.json({
                status: 0,
                msg: "Invalid session token."
            })
        })
    });
}

common.getIdByTokenSocket = function(token) {
    return new Promise(resolve => {
        sql.query(`select * from session where session = '${token}'`, (error, sessionResult) => {
            if (error) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult.length == 0) return 0

            if (sessionResult[0].user_id) {
                resolve(sessionResult[0].user_id);
            } else return 0
        })
    });
}

common.getuserNameById = function(userId) {
    return new Promise(resolve => {
        sql.query(`select * from users where user_id = '${userId}'`, (error, userData) => {
            if (error) return res.json({
                status: 0,
                msg: "Faild to featch Data."
            })

            if (userData.length == 0) return 0

            if (userData[0].user_id) {
                resolve(userData[0].first_name + ' ' + userData[0].last_name);
            } else return 0
        })
    });
}

common.checkIsAdminThenReturnId = function(req, res) {
    return new Promise(resolve => {
        var token = req.headers.authorization;
        sql.query(`select * from session where session = '${token}'`, (error, sessionResult) => {
            if (error) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult.length == 0) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult[0].user_id) {
                sql.query(`select * from users where user_id='${sessionResult[0].user_id}'`, (error, userResult) => {
                    if (error) return res.json({
                        status: 0,
                        msg: "Invalid User."
                    })

                    if (userResult[0].user_roll == 'Admin' || userResult[0].user_roll == 'SuperAdmin') {
                        resolve(userResult[0].user_id);
                    } else return res.json({
                        status: 0,
                        msg: "You are not autherized for this action only admin can perform this action."
                    })
                })

            } else return res.json({
                status: 0,
                msg: "Invalid session token."
            })
        })
    });
}

common.checkIsSuperAdminThenReturnId = function(req, res) {
    return new Promise(resolve => {
        var token = req.headers.authorization;
        sql.query(`select * from session where session = '${token}'`, (error, sessionResult) => {
            if (error) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult.length == 0) return res.json({
                status: 0,
                msg: "Invalid session token."
            })

            if (sessionResult[0].user_id) {
                sql.query(`select * from users where user_id='${sessionResult[0].user_id}'`, (error, userResult) => {
                    if (error) return res.json({
                        status: 0,
                        msg: "Invalid User."
                    })

                    if (userResult[0].user_roll == 'SuperAdmin') {
                        resolve(userResult[0].user_id);
                    } else return res.json({
                        status: 0,
                        msg: "You are not autherized for this action only Super admin can perform this action."
                    })
                })

            } else return res.json({
                status: 0,
                msg: "Invalid session token."
            })
        })
    });
}

common.changePasswordEmail = function(email, code) {
    return new Promise((resolve, reject) => {
        let transporter = nodemailer.createTransport({
            host: 'smtp.gmail.com',
            port: 587,
            secure: false,
            auth: {
                user: 'minhaj123technado@gmail.com',
                pass: 'geeks&bachelors',
            },
        });
        var html = "<P>Please change your password by click on this link</p><br> <a> http://localhost:4200/verifyForgotPassword?code=" + code + "</a>"
        transporter.sendMail({
            from: '"minhaj123technado@gmail.com',
            to: email,
            subject: "Change Password Email",
            html: html
        }, (error, result) => {
            if (error) {
                console.log("error is " + error);
                resolve(false);
            } else {
                console.log('Email sent: ' + info.response);
                resolve(true);
            }
        })
    })
}