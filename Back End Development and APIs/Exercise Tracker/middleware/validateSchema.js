import { validationResult } from "express-validator";

const validateSchema = (req, res, next) => {
  try {
    validationResult(req).throw();
    return next();
  } catch (err) {
    return res.status(400).send(err.mapped());
  }
};

export default validateSchema;
