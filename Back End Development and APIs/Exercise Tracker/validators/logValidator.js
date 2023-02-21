import { query } from "express-validator";

import validateSchema from "../middleware/validateSchema.js"

const dateFormat = /^\d{4}-\d{1,2}-\d{1,2}$/;

export const validateGetQuery = [
  query("from")
    .isString()
    .custom((value) => dateFormat.test(value))
    .customSanitizer((value) => {
      return new Date(value)
    })
    .optional(),
  query("to")
    .isString()
    .custom((value) => dateFormat.test(value))
    .customSanitizer((value) => {
      return new Date(value)
    })
    .optional(),
  query("limit").isNumeric().optional(),
  function(req, res, next) {
    validateSchema(req, res, next)
  }
];
