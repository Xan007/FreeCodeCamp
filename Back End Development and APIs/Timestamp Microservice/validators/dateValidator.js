import { param, validationResult } from "express-validator";

function isNumeric(num) {
  return !isNaN(num);
}

export const checkDateParam = [
  param("date")
    .custom((value) => {
      return isNumeric(value) || new Date(value) != "Invalid Date";
    })
    .customSanitizer((value) => {
      if (isNumeric(value)) value = parseInt(value);
      return new Date(value);
    }),
  (req, res, next) => {
    try {
      validationResult(req).throw();
      return next();
    } catch (err) {
      return res.status(400).send({
        error: "Invalid Date",
      });
    }
  },
];
