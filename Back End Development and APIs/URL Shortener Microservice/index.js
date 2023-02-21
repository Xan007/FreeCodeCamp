import dotenv from "dotenv";
import express from "express";
import cors from "cors";
dotenv.config();

import router from "./routes/index.js";
import bodyParser from "body-parser";

import "./db.js"

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true}))
app.use(express.json())
app.use("/public", express.static(`${process.cwd()}/public`));

app.use("/api", router);

app.get("/", function (req, res) {
  res.sendFile(process.cwd() + "/views/index.html");
});

const listener = app.listen(process.env.PORT || 3000, function () {
  console.log(`Listening on port ${listener.address().port}`);
});
