import exerciseObject from "./shared/exerciseObject.js"

import mongoose, { Schema, model } from "mongoose";
import { getUsernameFromId } from "../controllers/userController.js";

const logSchema = new Schema({
  _id: {
    type: mongoose.Types.ObjectId,
    ref: "User",
  },
  count: {
      type: Number,
      default: 0
  },
  log: [{
    type: exerciseObject, 
    default: []
  }],
});

//Añade la cuenta de logs, devuelve un objeto nuevo
logSchema.method("updateCount", function() {
  this.count = this.log.length
})

logSchema.method("addUsername", async function () {
  const logObject = this.toObject()

  logObject.username = await getUsernameFromId(this._id)

  return logObject
})

logSchema.method("addExercise", function(exercise) {
  delete exercise._id

  this.log.push(exercise)
})

const Log = model("Log", logSchema);

export default Log;
