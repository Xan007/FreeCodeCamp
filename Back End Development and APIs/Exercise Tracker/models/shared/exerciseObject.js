import { Schema } from "mongoose";

const exerciseObject = new Schema(
  {
    description: {
      type: String,
    },
    duration: {
      type: Number,
    },
    date: {
      type: String,
    },
  },
  {
    _id: false,
  }
);

export default exerciseObject