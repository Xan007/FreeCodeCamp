import dotenv from "dotenv";
dotenv.config();

import express from "express";
import cors from "cors";
import routes from "./routes/index.js";

import { dirname } from "path";
import { fileURLToPath } from "url";
const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();

app.use(cors({ optionsSuccessStatus: 200 }));
app.use(express.json())
app.use(express.static("public"));
app.use("/api", routes);

app.get("/", function (req, res) {
  res.sendFile(__dirname + "/views/index.html");
});

const listener = app.listen(process.env.PORT, function () {
  console.log("Your app is listening on port " + listener.address().port);
});
