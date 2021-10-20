var sql = require('../config');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('$encodeDecodeSecKeyYouCanChangeIt$');
const jwt = require('jsonwebtoken');
var accountSid = 'AC2d01f1aeca08c4965967d0094ebfaa45';
var authToken = '48792a0d619ad7dceb283e6d9a17f9d1';
const client = require('twilio')(accountSid, authToken);

exports.signup = async(body, cb) => {
    var email = body.email.toLowerCase();
    sql.query(`select * from users where email = '${email}'`, (error, userData) => {
        if (error) return cb(error, null);
        if (userData.length == 0) {
            var pass = cryptr.encrypt(body.password);
            var values = [
                body.first_name,
                body.last_name,
                email,
                pass,
                body.phone
            ]
            sql.query("insert into users (first_name, last_name, email, password, phone) values (?,?,?,?,?)", values, (error, result) => {
                if (error) return cb(error, null);
                return cb(null, result);
            })
        } else return cb("User already registered with this email", null);
    })
}

exports.login = async(body, cb) => {
    var email = body.email.toLowerCase();
    sql.query(`select * from users where email = '${email}'`, (error, userData) => {
        if (error) return cb(error, null);
        if (userData.length > 0) {
            var pass = cryptr.decrypt(userData[0].password);
            if (pass == body.password) {
                var token = jwt.sign({ userId: userData[0].user_id }, 'todo-app-super-shared-secret', { expiresIn: '1h' }, { algorithm: 'RS256' });
                var sessionValue = [
                    userData[0].user_id,
                    token
                ];
                sql.query(`select * from session where user_id = '${userData[0].user_id}'`, (error, sessionResult) => {
                    if (error) cb("Faild to featch user data", null);
                    if (sessionResult.length > 0) {
                        sql.query(`update session set session = '${token}' where user_id='${userData[0].user_id}'`, (error, sessionData) => {
                            if (error) return cb(error, null);
                            return cb(null, {
                                user_id: userData[0].user_id,
                                first_name: userData[0].first_name,
                                last_name: userData[0].last_name,
                                email: userData[0].email,
                                user_roll: userData[0].user_roll,
                                user_image: userData[0].user_image,
                                token: token
                            })
                        });
                    } else {
                        sql.query(`insert into session (user_id, session) values (?,?)`, sessionValue, (error, sessionData) => {
                            if (error) return cb(error, null);
                            return cb(null, {
                                user_id: userData[0].user_id,
                                first_name: userData[0].first_name,
                                last_name: userData[0].last_name,
                                email: userData[0].email,
                                user_image: userData[0].user_image,
                                token: token
                            })
                        });
                    }
                })
            } else {
                return cb("Invalid password", null);
            }
        } else return cb("No user is found against this email address. Please check your email address.", null);
    })
}

exports.profile = async(userId, cb) => {
    sql.query(`select first_name, last_name, email from users where user_id = '${userId}'`, (error, userData) => {
        if (error) return cb(error, null);
        if (userData.length > 0) {
            cb(null, userData);
        } else return cb("User not available.", null);
    })
}

exports.updateProfile = async(body, userId, cb) => {
    var updateValues = [
        body.first_name,
        body.last_name
    ];
    sql.query(`update users set first_name = ?, last_name = ? where user_id = ${userId}`, updateValues, (error, updatedResult) => {
        if (error) cb(error, null);
        cb(null, updatedResult);
    })

}

exports.forgotPassword = async(body, cb) => {
    var email = body.email.toLowerCase();
    sql.query(`select * from users where email = '${email}'`, (error, userData) => {
        if (userData.length > 0) {
            if (userData[0].login_type != 'Google') {
                var code = common.stringGen();
                sql.query(`update users set forgot_password_code ='${code}' where user_id ='${userData[0].user_id}'`, (error, result) => {
                    if (error) return cb("some thing going wrong, code not updated, please try again later.", null)
                    var emailInfo = common.changePasswordEmail(email, code);
                    if (emailInfo) {
                        return cb(null, "please check your email address, we have send you change password link.")
                    } else return cb("Internal server error please try again later", null);
                });
            } else return cb("Google signup user can not be change password.", null);
        } else return cb("User does not exist", null);
    })
}

exports.verifyChangePassword = async(body, cb) => {
    sql.query(`select * from users where forgot_password_code = '${body.code}'`, (error, userData) => {
        if (userData.length > 0) {
            var pass = cryptr.encrypt(body.password);
            sql.query(`update users set password ='${pass}' where user_id ='${userData[0].user_id}'`, (error, result) => {
                if (error) {
                    return cb(error, null);
                } else return cb(null, result);
            });
        } else cb("Invalid verification code", null);
    })
}

exports.socialSignInSignUp = async(body, cb) => {
    var email = body.email.toLowerCase();
    sql.query(`select * from users where email = '${email}'`, (error, userData) => {
        if (error) return cb(error, null);
        var orgPass = "Ka$HiF123321";
        var encryptPass = cryptr.encrypt("Ka$HiF123321");
        if (userData.length == 0) {
            var values = [
                body.firstName,
                body.lastName,
                email,
                encryptPass,
                body.id,
                'Google'
            ]
            sql.query("insert into users (first_name, last_name, email, password, google_id, login_type) values (?,?,?,?,?,?)", values, (error, result) => {
                if (error) return cb(error, null);
                var token = jwt.sign({ userId: result.insertId }, 'todo-app-super-shared-secret', { expiresIn: '1h' }, { algorithm: 'RS256' });
                var sessionValue = [
                    result.insertId,
                    token
                ];
                sql.query(`insert into session (user_id, session) values (?,?)`, sessionValue, (error, sessionData) => {
                    if (error) return cb(error, null);
                    return cb(null, {
                        first_name: body.firstName,
                        last_name: body.lastName,
                        email: email,
                        token: token
                    })
                });
            })
        } else {
            var decryptPass = cryptr.decrypt(userData[0].password);
            if (userData[0].google_id == body.id && userData[0].login_type == 'Google' && orgPass == decryptPass) {

                var token = jwt.sign({ userId: userData[0].user_id }, 'todo-app-super-shared-secret', { expiresIn: '1h' }, { algorithm: 'RS256' });
                var sessionValue = [
                    userData[0].user_id,
                    token
                ];
                sql.query(`select * from session where user_id = '${userData[0].user_id}'`, (error, sessionResult) => {
                    if (error) cb("Faild to featch user data", null);
                    if (sessionResult.length > 0) {
                        sql.query(`update session set session = '${token}' where user_id='${userData[0].user_id}'`, (error, sessionData) => {
                            if (error) return cb(error, null);
                            return cb(null, {
                                user_id: userData[0].user_id,
                                first_name: userData[0].first_name,
                                last_name: userData[0].last_name,
                                email: userData[0].email,
                                user_image: userData[0].user_image,
                                user_roll: userData[0].user_roll,
                                token: token
                            })
                        });
                    } else {
                        sql.query(`insert into session (user_id, session) values (?,?)`, sessionValue, (error, sessionData) => {
                            if (error) return cb(error, null);
                            return cb(null, {
                                user_id: userData[0].user_id,
                                first_name: userData[0].first_name,
                                last_name: userData[0].last_name,
                                email: userData[0].email,
                                user_image: userData[0].user_image,
                                user_roll: userData[0].user_roll,
                                token: token
                            })
                        });
                    }
                })

            } else {
                return cb("This email already has been taken please try with another one.");
            }
        }
    })
}

exports.getAllUserForAdmin = async(userId, cb) => {
    sql.query(`select user_id,first_name, last_name, user_roll, user_image from users where user_id not in (${userId})`, (error, userData) => {
        if (error) {
            return cb(error, null);
        } else return cb(null, userData);
    })
}

exports.updateUserRollBySuperAdmin = async(body, cb) => {
    sql.query(`update users set user_roll = '${body.userRoll}' where user_id = '${body.userId}'`, (error, userData) => {
        if (error) {
            return cb(error, null);
        } else return cb(null, userData);
    })
}

exports.otp = async (req, cb) =>{
    try{
        console.log(req.body);
        if (req.body.phonenumber) {
        client
        .verify
        .services("VA1a3289fab773f058b87360867ec76ac3")
        .verifications
        .create({
            to: `+${req.body.phonenumber}`,
            channel: req.body.channel==='call' ? 'call' : 'sms' 
        })
        .then(data => {
            console.log(data);
            cb(null, "Verification code has been sent!!")
        }) 
        } else {
            console.log("Wrong phone number");
            cb("Wrong phone number please enter Phone number with country code without + sign")
        }
    } catch(e){
        console.log(e);
        cb(e)
    }
}

exports.verifyOtp = async (req, cb) =>{
    try{
        if (req.body.phonenumber && req.body.code.length == 6) {
            client
                .verify
                .services("VA1a3289fab773f058b87360867ec76ac3")
                .verificationChecks
                .create({
                    to: `+${req.body.phonenumber}`,
                    code: req.body.code
                })
                .then(data => {
                    if (data.status === "approved") {
                        cb(null,"User is Verified!!");
                    }
                })
        } else {
            cb("Wrong phone number or code");
        }
    } catch(e){
        console.log(e);
        cb(e)
    }
}