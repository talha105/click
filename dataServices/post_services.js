var sql = require('../config');
const Cryptr = require('cryptr');
const cryptr = new Cryptr('$encodeDecodeSecKeyYouCanChangeIt$');
const jwt = require('jsonwebtoken');
var formidable = require('formidable');
const fs = require("fs");
const path = require("path");
var asyncForEach = require('async-foreach').forEach;
const { off } = require('../config');

exports.getPostList = async(userId, cb) => {
    sql.query(`select * from post where sender_id = '${userId}' and is_deleted = 0 order by post_id desc`, (error, result) => {
        if (error) return cb("Data not featch successfully.")
        return cb(null, result)
    })
}

exports.deletePost = async(userId, req, cb) => {
    sql.query(`delete from post where sender_id ='${userId}' and post_id = '${req.body.id}'`, (error, result) => {
        if (error) return cb(error);
        return cb(null, "Data has been deleted successfully.")
    })
}

exports.getPostById = async(userId, req, cb) => {
    sql.query(`select * from post where sender_id ='${userId}' and post_id = '${req.body.id}'`, (error, result) => {
        if (error) return cb(error);
        return cb(null, result)
    })
}

exports.updatePost = async(path, userId, req, cb) => {
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
                    if (error) return cb(error);
                    return cb(null, "post has been updated successfully.")
                })
            });
        });
        form.parse(req);
    } else {
        sql.query(`update post set title ='${title}' where sender_id='${userId}' and post_id ='${post_id}'`, (error, result) => {
            if (error) return cb(error);
            return cb(null, "post has been updated successfully.")
        })
    }

}

exports.getAllPost = async(offset, cb) => {
    sql.query(`select p.post_id, p.title, p.sender_id, p.image_url, p.created_at, u.first_name, u.last_name,u.user_image,(select count(0) from likes as l where l.post_id=p.post_id) as 'total_likes', (select count(0) from post_views as v where v.post_id=p.post_id) as 'total_views', (select count(*) from post p where is_deleted = 0) as totalcount from post p left join users u on p.sender_id = u.user_id order by p.post_id desc LIMIT 10 OFFSET ${offset}`, (error, result) => {
        if (error) return cb(error);

        asyncForEach(result, function(item, index) {
            var done = this.async();
            sql.query(`select c.*, u.user_image, u.first_name, u.last_name from comment c left join users u on c.user_id = u.user_id where c.post_id = '${item.post_id}' and is_deleted = 0`, function(err, commentResult) {
                item.comments = commentResult;
                sql.query(`SELECT c.*,u.first_name, u.last_name, u.user_image from comment as c INNER JOIN users as u on u.user_id = c.user_id where c.comment_id IN (SELECT MAX(com.comment_id) from comment as com where com.user_id = c.user_id AND post_id = '${item.post_id}') limit 5`, (error, top5Res) => {
                    item.top5Comment = top5Res;
                    if (result.length != index + 1) done()
                    if (result.length == index + 1) return cb(null, result);
                })
            });
        });
    })
}

exports.getSinglePostById = async(postId, cb) => {
    sql.query(`select p.post_id, p.title, p.sender_id, p.image_url, p.created_at, u.first_name, u.last_name,u.user_image,(select count(0) from likes as l where l.post_id=p.post_id) as 'total_likes', (select count(0) from post_views as v where v.post_id=p.post_id) as 'total_views' from post p left join users u on p.sender_id = u.user_id where p.post_id ='${postId}'`, (error, result) => {
        if (error) return cb(error);

        asyncForEach(result, function(item, index) {
            var done = this.async();
            sql.query(`select c.*, u.user_image, u.first_name, u.last_name from comment c left join users u on c.user_id = u.user_id where c.post_id = '${item.post_id}' and is_deleted = 0`, function(err, commentResult) {
                item.comments = commentResult;
                sql.query(`SELECT c.*, u.user_image from comment as c INNER JOIN users as u on u.user_id = c.user_id where c.comment_id IN (SELECT MAX(com.comment_id) from comment as com where com.user_id = c.user_id AND post_id = '${item.post_id}') limit 5`, (error, top5Res) => {
                    item.top5Comment = top5Res;
                    if (result.length != index + 1) done()
                    if (result.length == index + 1) return cb(null, result);
                })
            });
        });
    })
}

exports.comment = async(userId, body, cb) => {
    var val = [userId, body.postId, body.comment];
    sql.query(`insert into comment (user_id, post_id, comment) values(?,?,?)`, val, (error, result) => {
        if (error) return cb(error);
        sql.query(`select c.*, u.user_image, u.first_name, u.last_name from comment c left join users u on c.user_id = u.user_id where c.post_id = '${body.postId}' and is_deleted = 0`, (error, commentResult) => {
            if (error) return cb(error);
            return cb(null, commentResult);
        })
    })
}

exports.deleteComment = async(userId, body, cb) => {
    sql.query(`delete from comment where user_id = '${userId}' and post_id = '${body.postId}' and comment_id = '${commentId}'`, val, (error, result) => {
        if (error) return cb(error);
        // sql.query(`select c.*, u.user_image, u.first_name, u.last_name from comment c left join users u on c.user_id = u.user_id where c.post_id = '${body.postId}' and is_deleted = 0`, (error, commentResult) => {
        //     if (error) return cb(error);
        return cb(null, result);
        // })
    })
}

exports.like = async(userId, postId, cb) => {

    sql.query(`select * from likes where post_id = '${postId}' and user_id='${userId}'`, (error, likeResult) => {
        if (error) return cb(error, null)
        if (likeResult.length == 0) {
            var val = [userId, postId];
            sql.query(`insert into likes (user_id, post_id) values(?,?)`, val, (error, insertedResult) => {
                if (error) return cb(error);

                sql.query(`select * from likes where post_id = '${postId}'`, (error, likeResults) => {
                    if (error) return cb(error);
                    return cb(null, likeResults);
                })
            })
        } else {
            // return cb("Already liked", null);
            sql.query(`delete from likes where post_id = '${postId}' and user_id = '${userId}'`, (error, unlikeResult) => {
                if (error) return cb(error, null);
                sql.query(`select * from likes where post_id = '${postId}'`, (error, likeResults) => {
                    if (error) return cb(error);
                    return cb(null, likeResults);
                })
            })
        }
    })
}

exports.seenPost = async(userId, postIdArr, cb) => {
    asyncForEach(postIdArr, function(item, index) {
        var done = this.async();
        sql.query(`select * from post_views where post_id = '${item}' and user_id = ${userId}`, function(err, commentResult) {
            if (commentResult.length == 0) {
                var val = [
                    userId,
                    item
                ];
                sql.query(`insert into post_views (user_id, post_id) values(?,?)`, val, (error, insertedViewsResult) => {
                    if (postIdArr.length != index + 1) done()
                    if (postIdArr.length == index + 1) return cb(null, postIdArr);
                })
            } else {
                if (postIdArr.length != index + 1) done()
                if (postIdArr.length == index + 1) return cb(null, postIdArr);
            }
        });
    });
}

exports.notifications = async(userId, limit, cb) => {
    sql.query(`SELECT c.user_id, c.post_id,c.created_at, u.user_id, u.first_name, u.last_name, u.user_image, p.sender_id, p.image_url as post_image from comment c left join users u on u.user_id = c.user_id left join post p on p.post_id=c.post_id where p.sender_id = '${userId}' and c.user_id not in (${userId}) order by c.created_at desc limit ${limit}`, (error, notificationResult) => {
        if (error) return cb(error);
        return cb(null, notificationResult);
    })
}

exports.getRandomTeamMates = async(userId, cb) => {
    sql.query(`SELECT  first_name, last_name, user_image from users where user_roll ='Client' order by RAND() limit 20 `, (error, result) => {
        if (error) return cb(error);
        sql.query(`SELECT  first_name, last_name, user_image from users where user_roll ='Admin' or user_roll ='SuperAdmin' order by RAND() limit 20 `, (error, results) => {
            if (error) return cb(error);
            var data = {};
            data.mates = result;
            data.leaders = results;
            return cb(null, data);
        })
    })
}