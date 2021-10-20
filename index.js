const express = require('express')
const app = express();
var bodyParser = require('body-parser');
var routes = require('./routes/routes');
const path = require("path");
var cors = require('cors');
const http = require('http');
const server = http.Server(app);

app.use(cors());
app.use(bodyParser.json({ limit: '10mb', extended: true }));
app.use(bodyParser.urlencoded({ limit: '10mb', extended: true }));

const io = require("socket.io")(server);

// const io = require("socket.io")(server, {
//     cors: {
//         origin: "https://webprojectmockup.com/9445",
//         methods: ["GET", "POST"]
//     }
// });

const port = process.env.PORT || 3001;

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