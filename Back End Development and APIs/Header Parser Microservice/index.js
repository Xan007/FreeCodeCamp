import dotenv from "dotenv"
import express from "express"
import cors from "cors"
dotenv.config();

import { dirname } from 'path';
import { fileURLToPath } from 'url';
const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();

app.use(cors({ optionsSuccessStatus: 200 }));

app.use(express.static('public'));

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});

app.get('/api/hello', function (req, res) {
  res.json({ greeting: 'hello API' });
});

app.get("/api/whoami", (req, res) => {
    res.json({
        "ipaddress": req.socket.remoteAddress,
        "language": req.get('accept-language'),
        "software": req.get('user-agent')
    });
})

const listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
