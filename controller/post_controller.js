'user strict';
var sql = require('../config');
var commonServices = require('../commonServices/common');
var postService = require('../dataServices/post_services');

var formidable = require('formidable');
const fs = require("fs");
const path = require("path");

exports.sendPost = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
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
                var title = req.headers.title;
                var values = [
                    userId,
                    title,
                    imageUrl
                ]
                sql.query(`insert into post (sender_id, title, image_url) values (?,?,?)`, values, (error, result) => {
                    if (error) return res.json({
                        status: 0,
                        msg: "Post not save successfully."
                    })

                    return res.json({
                        status: 1,
                        msg: "post has been uploaded successfully."
                    })
                })
            });
        });
        form.parse(req);
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.getPostList = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
        postService.getPostList(userId, (error, result) => {
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

exports.deletePost = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
        postService.deletePost(userId, req, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Data has been deleted successfully."
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

exports.getPostById = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
        postService.getPostById(userId, req, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Data has been featch successfully."
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

exports.updatePost = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
        var title = req.headers.title;
        var post_id = req.headers.post_id;
        var isImage = req.headers.imageavailable;
        if (isImage == 'yes') {
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
                    sql.query(`update post set image_url='${imageUrl}', title ='${title}' where sender_id='${userId}' and post_id ='${post_id}'`, (error, result) => {
                        if (error) return res.json({
                            status: 0,
                            msg: "Failed to update."
                        });

                        return res.json({
                            status: 1,
                            msg: "Updated successfully."
                        });
                    })
                });
            });
            form.parse(req);
        } else {
            sql.query(`update post set title ='${title}' where sender_id='${userId}' and post_id ='${post_id}'`, (error, result) => {
                if (error) return res.json({
                    status: 0,
                    msg: "Failed to update."
                });

                return res.json({
                    status: 1,
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

exports.getAllPost = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.getAllPost(req.body.offset, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })
            return res.json({
                status: 1,
                data: result,
                msg: "Data has been featch successfully."
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

exports.getSinglePostById = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        if (req.body.postId) {
            postService.getSinglePostById(req.body.postId, (error, result) => {
                if (error) return res.json({
                    status: 0,
                    msg: error
                })
                return res.json({
                    status: 1,
                    data: result,
                    msg: "Data has been featch successfully."
                })
            })
        } else return res.json({
            status: 0,
            msg: "Post id is missing."
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.comment = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.comment(userId, req.body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                post_id: req.body.postId,
                msg: "Data has been featch successfully."
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

exports.like = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.like(userId, req.body.postId, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                totalLike: result.length,
                post_id: req.body.postId,
                msg: "Data has been featch successfully."
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

exports.seenPost = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.seenPost(userId, req.body.postIds, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                post_id: req.body.postId,
                msg: "views updated successfully."
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

exports.notifications = async(req, res) => {
    try {
        var userId = await commonServices.checkIsAdminThenReturnId(req, res);
        console.log(req.body.limit);
        if (req.body.limit) {
            postService.notifications(userId, req.body.limit, (error, result) => {
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
        } else return res.json({
            status: 0,
            msg: "Please pass the limit"
        })
    } catch (e) {
        console.log(e);
        return res.json({
            status: 0,
            msg: e
        });
    }
}

exports.getRandomTeamMates = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.getRandomTeamMates(userId, (error, result) => {
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

exports.deleteComment = async(req, res) => {
    try {
        var userId = await commonServices.getUserIdByToken(req, res);
        postService.deleteComment(userId, req.body, (error, result) => {
            if (error) return res.json({
                status: 0,
                msg: error
            })

            return res.json({
                status: 1,
                data: result,
                msg: "Data has been deleted successfully."
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