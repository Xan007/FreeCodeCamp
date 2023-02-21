import { Router } from "express";

import { updateExercise } from "../controllers/exerciseController.js"
import { validatePostExercise } from "../validators/exerciseValidator.js";

const router = Router();

//To do: Verificacion de la fecha y duration en sus tipos de datos
router.post("/", validatePostExercise, async(req, res) => {
  let { description, duration, date = new Date().toDateString() } = req.body;

  const exercise = await updateExercise(req.targetUser._id, {
    description: description,
    duration: duration,
    date: String(date)
  })
  res.send(await exercise.addUsername())
});

export default router;
