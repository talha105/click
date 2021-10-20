'user strict';
var sql = require('../config');
var commonServices = require('../commonServices/common');
var userService = require('../dataServices/user_services');
var formidable = require('formidable');
const fs = require("fs");
const path = require("path");

exports.signup = async(req, res) => {
    try {

        var body = req.body;

        if (!commonServices.required(body.first_name)) return res.json({
            status: 0,
            msg: 'First name is missing.'
        })

        if (!commonServices.required(body.last_name)) return res.json({
            status: 0,
            msg: 'Last name is missing.'
        })

        if (!commonServices.required(body.email)) return res.json({
            status: 0,
            msg: 'Email is missing.'
        })

        if (!commonServices.validateEmail(body.email)) return res.json({
            status: 0,
            msg: 'Invalid email address.'
        })

        if (!commonServices.required(body.password)) return res.json({
            status: 0,
            msg: 'Password is missing.'
        })

        if (commonServices.validatePassword(body.password)) return res.json({
            status: 0,
            msg: 'Password must be of six digits'
        })

        userService.signup(body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Signup Successfully."
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
exports.login = async(req, res) => {
    try {

        var body = req.body;

        if (!commonServices.required(body.email)) return res.json({
            status: 0,
            msg: 'Email is missing.'
        })

        if (!commonServices.validateEmail(body.email)) return res.json({
            status: 0,
            msg: 'Invalid email address.'
        })

        if (!commonServices.required(body.password)) return res.json({
            status: 0,
            msg: 'Password is missing.'
        })

        if (commonServices.validatePassword(body.password)) return res.json({
            status: 0,
            msg: 'Password must be of six digits'
        })

        userService.login(body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "login Successfully."
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

exports.profile = async(req, res) => {
    try {
        var body = req.body;
        var userId = await commonServices.getUserIdByToken(req, res);
        userService.profile(userId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Data featched successfully."
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

exports.updateProfile = async(req, res) => {
    try {
        var body = req.headers;
        var userId = await commonServices.getUserIdByToken(req, res);

        if (!commonServices.required(body.isfile)) return res.json({
            status: 0,
            msg: 'File key is missing.'
        })

        if (!commonServices.required(body.lastname)) return res.json({
            status: 0,
            msg: 'Last name is missing.'
        })

        if (!commonServices.required(body.firstname)) return res.json({
            status: 0,
            msg: 'First name is missing.'
        })

        if (body.isfile == 'yes') {
            var imagePath = [];
            var form = new formidable.IncomingForm();
            imgPath = path.join(__dirname + '/public/uploads');
            form.uploadDir = path.join(__dirname + '/public/uploads');
            form.on('file', function(field, images) {
                var altName = '';
                var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                var charactersLength = characters.length;
                for (var i = 0; i < 32; i++) {
                    altName += characters.charAt(Math.floor(Math.random() * charactersLength));
                }
                imagePath.push(altName + images.name);
                fs.rename(images.path, path.join(form.uploadDir, altName + images.name), function(error, results) {
                    if (error) return res.json({
                        status: 0,
                        msg: "Image not uploaded."
                    });
                    var imageUrl = 'controller/public/uploads/' + imagePath[0];
                    sql.query(`update users set user_image ='${imageUrl}', first_name ='${body.firstname}', last_name ='${body.lastname}' where user_id ='${userId}'`, (error, result) => {
                        if (error) return res.json({
                            status: 0,
                            msg: "Failed to update."
                        });

                        return res.json({
                            status: 1,
                            first_name: body.firstname,
                            last_name: body.lastname,
                            user_image: imageUrl,
                            msg: "Updated successfully."
                        });
                    })
                });
            });
            form.parse(req);
        } else {
            sql.query(`update users set first_name ='${body.firstname}', last_name ='${body.lastname}' where user_id = '${userId}'`, (error, result) => {
                if (error) return res.json({
                    status: 0,
                    msg: "Failed to update."
                });

                return res.json({
                    status: 1,
                    first_name: body.firstname,
                    last_name: body.lastname,
                    user_image: '',
                    msg: "Updated successfully."
                });
            })
        }
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.forgotPassword = async(req, res) => {
    try {
        var body = req.body;

        if (!commonServices.required(body.email)) return res.json({
            status: 0,
            msg: 'Email is missing.'
        })

        if (!commonServices.validateEmail(body.email)) return res.json({
            status: 0,
            msg: 'Invalid email address.'
        })

        userService.forgotPassword(body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "We have send you a email about change password, please check your email."
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

exports.verifyChangePassword = async(req, res) => {
    try {
        var body = req.body;

        if (!commonServices.required(body.code)) return res.json({
            status: 0,
            msg: 'Verify code is missing.'
        })

        if (!commonServices.required(body.password)) return res.json({
            status: 0,
            msg: 'Password is missing'
        })

        userService.verifyChangePassword(body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Your password hass been updated successfully."
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

exports.socialSignInSignUp = async(req, res) => {
    try {
        var body = req.body;

        if (!commonServices.required(body.email)) return res.json({
            status: 0,
            msg: 'Email is missing can not be continue.'
        })

        userService.socialSignInSignUp(body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Login successfully"
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

exports.getAllUserForAdmin = async(req, res) => {
    try {
        var userId = await commonServices.checkIsSuperAdminThenReturnId(req, res);
        userService.getAllUserForAdmin(userId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Successfully get all users"
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

exports.otp = async(req, res) => {
    try {
        // var userId = await commonServices.checkIsSuperAdminThenReturnId(req, res);
        userService.otp(req, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Successfully get all users"
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

exports.verifyOtp = async(req, res) => {
    try {
        // var userId = await commonServices.checkIsSuperAdminThenReturnId(req, res);
        userService.verifyOtp(req, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Successfully get all users"
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

exports.updateUserRollBySuperAdmin = async(req, res) => {
    try {
        var userId = await commonServices.checkIsSuperAdminThenReturnId(req, res);
        if (!commonServices.required(req.body.userId)) return res.json({
            status: 0,
            msg: 'User id is missing.'
        })

        if (!commonServices.required(req.body.userRoll)) return res.json({
            status: 0,
            msg: 'Roll is missing.'
        })
        userService.updateUserRollBySuperAdmin(req.body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Successfully updated user roll"
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