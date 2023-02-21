import { Router } from "express";
import { customAlphabet } from "nanoid";

import urlModel from "../models/url.js";

const httpRegex = /^(http(s)?:\/\/[a-zA-Z0-9\-_]+\.[a-zA-Z]+(.)+)+$/;

const alphabet = "0123456789aAeEiIoOuU";
const nanoid = customAlphabet(alphabet, 9);

const router = Router();

function isValidHttpUrl(string) {
  return httpRegex.test(string);
}

router.post("/", async (req, res) => {
  const { url } = req.body;

  if (!isValidHttpUrl(url))
    return res.json({
      error: "invalid url",
    });

  const newUrl = new urlModel({
    original_url: url,
    short_url: nanoid(),
  });

  try {
    await newUrl.save();

    return res.send(newUrl);
  } catch (err) {
    if (err.code === 11000 && err.name === "MongoServerError")
      return res.send(await urlModel.findOne({original_url: url}))
    return res.status(400).send(err);
  }
});

router.get("/:shortURL", async (req, res) => {
  const { shortURL } = req.params;

  const urlDoc = await urlModel.findOne({ short_url: shortURL });

  if (!urlDoc) return res.status(404).send("No original_url for short_url");
  
  return res.redirect(urlDoc.original_url);
});

export default router;
