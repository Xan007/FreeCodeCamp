import dotenv from "dotenv"
dotenv.config()

import mongoose from "mongoose";

const MONGO_URI =
  process.env.MONGO_URI;

mongoose.set("strictQuery", false);
mongoose.connect(MONGO_URI);

mongoose.connection.on("connected", () => {
  console.log("Conectado a la base de datos!");
});

mongoose.connection.on("error", (err) => {
  console.log(`Error al conectar a la base de datos: ${err}`);
});

mongoose.connection.on("disconnected", () => {
  console.log("Desconectado de la base de datos");
});
