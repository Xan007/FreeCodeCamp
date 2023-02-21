import mongoose, { Schema, model } from "mongoose";
import { getUsernameFromId } from "../controllers/userController.js";

import exerciseObject from "./shared/exerciseObject.js"

const exerciseSchema = new Schema({
  _id: {
    type: mongoose.Types.ObjectId,
    ref: "User",
  },
  ...exerciseObject.obj,
}, {
  versionKey: false
});

exerciseSchema.method("addUsername", async function () {
  let exerciseObj = this.toObject()

  exerciseObj.username = await getUsernameFromId(this._id)

  return exerciseObj
})

const Exercise = model("Exercise", exerciseSchema);

export default Exercise;