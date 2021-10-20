var sql = require('../config');

exports.getAllGroupChat = async(userId, cb) => {
    sql.query(`select gc.*, u.user_image as user_image, u.first_name, u.last_name from group_msgs as gc left join users u on u.user_id = gc.sender_id where gc.is_deleted = 0`, (error, result) => {
        console.log(error);
        if (error) return cb("Data not featch successfully.")
        return cb(null, result);
    })
}

exports.getUserList = async(userId, cb) => {
    sql.query(`select u.user_id, u.user_image as user_image, u.first_name, u.last_name, sc.user_id as online  from users u left join user_socket sc on sc.user_id = u.user_id where u.user_id not in (${userId})`, (error, result) => {
        console.log(error);
        if (error) return cb("Data not featch successfully.")
        return cb(null, result);
    })
}

exports.deleteChat = async(userId, chatId, cb) => {
    sql.query(`delete from group_msgs where sender_id = '${userId}' and id = '${chatId}'`, (error, result) => {
        console.log(error);
        if (error) return cb("Chat not deleted.")
        return cb(null, result);
    })
}

exports.addUserInChatList = async(body, cb) => {
    sql.query(`select * from chat where sender_id='${body.senderId}' and receiver_id ='${body.receiverId}' or receiver_id='${body.senderId}' and sender_id ='${body.receiverId}'`, (error, result) => {
        console.log(result);
    })
}