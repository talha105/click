const express = require('express')
const app = express();
var bodyParser = require('body-parser');
var routes = require('./routes/routes');
const path = require("path");
var cors = require('cors');
const fs = require("fs");
const http = require('https');

// var certificate = fs.readFileSync('/home/webprojectmockup/ssl/certs/webprojectmockup_com_b3c2d_b74f7_1634860799_263fad8fe524ceb38aa42818290ecbde.crt');
// var privateKey = fs.readFileSync('/home/webprojectmockup/ssl/keys/b3c2d_b74f7_6146587feb3d0f126f2bd06520da7369.key');

const server = http.Server(app);

app.use(cors());
app.options('*', cors());
app.use(bodyParser.json({ limit: '10mb', extended: true }));
app.use(bodyParser.urlencoded({ limit: '10mb', extended: true }));

// const io = require("socket.io")(server, {
//     cors: {
//         origin: "http://localhost:4200",
//         methods: ["GET", "POST"]
//     }
// });

const io = require("socket.io")(server, {
    cors: {
        origin: "https://click-server105.herokuapp.com",
        methods: ["GET", "POST"]
    }
});

const port = process.env.PORT || 9447;

app.use('/controller/public/uploads', express.static(path.join(__dirname, 'controller/public/uploads')));

app.post("downloadFile", (req, res) => {
    const file = path.resolve(__dirname, `req.body.fileName`);
    res.download(file);
})

app.use('/api', routes);

app.get('/', (req, res) => {
    return res.json({
        status: 1,
        msg: "server working successfully."
    })
});

require('./routes/socket_routes.js')(io);

server.listen(port, () => {
    console.log(`started on port: ${port}`);
});