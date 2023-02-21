import { Schema, model } from "mongoose";

import { initExercise } from "../controllers/exerciseController.js"
import { initLog } from "../controllers/logController.js"

import Log from "./Log.js";
import Exercise from "./Exercise.js";

const userSchema = new Schema({
  username: {
    type: String,
    unique: true
  },
});

//Cuando guarde, revise si existe log y exercise
//Sino creelos
userSchema.post("save", async function() {
  const { _id } = this

  if (!await Log.exists({_id: _id})) {
    await initLog(_id)
  }

  if (!await Exercise.exists({_id: _id})) {
    await initExercise(_id)
  }
})

const User = model("User", userSchema);

export default User;
