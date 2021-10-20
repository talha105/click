var sql = require('../config');
var commonServices = require('../commonServices/common');
var asyncForEach = require('async-foreach').forEach;
module.exports = function(io) {
    // var socketController = require('../controller/socket_controller.js')

    io.on('connect', async function(socket) {

        socket.on("connectSocket", async(data) => {
            var userId = await commonServices.getIdByTokenSocket(data.token);
            var userName = await commonServices.getuserNameById(userId);
            if (userId) {
                sql.query(`select * from user_socket where user_id = '${userId}'`, (error, res) => {
                    console.log(error, 'aaaaaaaaaaaaaaaaaaaaa');
                    if (res.length > 0) {
                        sql.query(`delete from user_socket where user_id = '${userId}'`, (error, res) => {

                            sql.query(`insert into user_socket (user_id, socket_id) values ('${userId}','${socket.id}')`, (error, result) => {
                                sql.query(`select u.user_id, u.user_image as user_image, u.first_name, u.last_name, sc.user_id as online  from users u left join user_socket sc on sc.user_id = u.user_id`, (error, result) => {
                                    return io.emit('getAllUserListThroughSocket', {
                                        status: 1,
                                        msg: "Successfully get messages data.",
                                        data: result
                                    })
                                })
                            })
                        })
                    } else {
                        sql.query(`insert into user_socket (user_id, socket_id) values ('${userId}','${socket.id}')`, (error, result) => {

                            sql.query(`select u.user_id, u.user_image as user_image, u.first_name, u.last_name, sc.user_id as online  from users u left join user_socket sc on sc.user_id = u.user_id`, (error, result) => {
                                return io.emit('getAllUserListThroughSocket', {
                                    status: 1,
                                    msg: "Successfully get messages data.",
                                    data: result
                                })
                            })
                        })
                    }
                })
            }
        });

        socket.on("sendGroupMsg", async(data) => {
            console.log(data,"dddddddddddddddddddddddd");
            var userId = await commonServices.getIdByTokenSocket(data.token);
            console.log(userId,"uuuuuuuuuuuuuuuuu");
            if (userId) {
                sql.query(`insert into group_msgs (sender_id, msg) values ('${userId}','${data.msg}')`, (error, GroupMsgResult) => {
                    console.log(error,"111111111111111")
                    if (error) socket.emit('getGroupMsg', {
                        status: 0,
                        msg: "Failed to insert in database."
                    })

                    sql.query(`select gc.*, u.user_image as user_image, u.first_name, u.last_name from group_msgs as gc left join users u on u.user_id = gc.sender_id where gc.is_deleted = 0`, (error, groupMsgData) => {
                        console.log(error,"22222222222222")
                        if (error) socket.emit('getGroupMsg', {
                            status: 0,
                            msg: "Failed to get message data."
                        })
                        
                        console.log(groupMsgData,"ggggggggggggggggg");
                        
                        io.emit('getGroupMsg', {
                            status: 1,
                            msg: "Successfully get messages data.",
                            data: groupMsgData
                        })
                    })

                })
            } else socket.emit('getGroupMsg', {
                status: 0,
                msg: "invalid token please login again."
            })
        });

        socket.on("disconnect", async() => {
            sql.query(`delete from user_socket where socket_id = '${socket.id}'`, (error, res) => {
                sql.query(`select u.user_id, u.user_image as user_image, u.first_name, u.last_name, sc.user_id as online  from users u left join user_socket sc on sc.user_id = u.user_id`, (error, result) => {
                    return io.emit('getAllUserListThroughSocket', {
                        status: 1,
                        msg: "Successfully get messages data.",
                        data: result
                    })
                })
            })
        })

        socket.on("getPostData", async(data) => {
            var userId = await commonServices.getIdByTokenSocket(data.token);
            sql.query(`select * from user_socket where user_id = '${userId}'`, (error, userSocketData) => {
                // if (error) return io.emit('getAsyncPostData', {
                //     status: 0,
                //     msg: "Faild to get Socket id.",
                // })
                if (userSocketData.length) {
                    var socketId = userSocketData[0].socket_id;
                    var postId = data.postId;
                    sql.query(`select c.*, u.user_image, u.first_name, u.last_name from comment c left join users u on c.user_id = u.user_id where c.post_id = '${postId}' and is_deleted = 0`, (error, commentResult) => {
                        // if (error) return io.emit('getAsyncPostData', {
                        //     status: 0,
                        //     msg: "Faild to get Post Data.",
                        // })

                        return io.to(socketId).emit('getAsyncPostData', {
                            status: 1,
                            data: commentResult,
                            post_id: postId,
                            msg: "Successfully featch Data.",
                        });
                    })
                }
            })
        })

        socket.on("onComponentDestroy", async() => {
            sql.query(`delete from user_socket where socket_id = '${socket.id}'`, (error, res) => {
                sql.query(`select u.user_id, u.user_image as user_image, u.first_name, u.last_name, sc.user_id as online  from users u left join user_socket sc on sc.user_id = u.user_id`, (error, result) => {
                    return io.emit('getAllUserListThroughSocket', {
                        status: 1,
                        msg: "Successfully get messages data.",
                        data: result
                    })
                })
            })
        })
        io.on('close', () => console.log('Client disconnected'));
    });
}