import { body } from "express-validator";

import validateSchema from "../middleware/validateSchema.js";

const dateFormat = /^\d{4}-\d{1,2}-\d{1,2}$/;

export const validatePostExercise = [
  body("description").exists().isString().notEmpty(),
  body("duration")
    .isNumeric()
    .custom((value) => value > 0),
  (req, res, next) => {
    if (!req.body.date)
        delete req.body.date
    next()
  },
  body("date")
    .optional()
    .custom((value) => dateFormat.test(value))
    .customSanitizer((value) => {
      return new Date(value).toDateString();
    }),
  (req, res, next) => {
    validateSchema(req, res, next);
  },
];
