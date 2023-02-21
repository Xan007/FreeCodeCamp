import { model, Schema } from "mongoose";

const urlSchema = new Schema({
    original_url: {
        type: String,
        required: true,
        unique: true
    },
    short_url: {
        type: String,
        required: true,
        unique: true
    }
})

const Url = model("Url", urlSchema)

export default Url