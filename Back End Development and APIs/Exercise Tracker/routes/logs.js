import { Router } from "express";

import { getLog } from "../controllers/logController.js";
import { validateGetQuery } from "../validators/logValidator.js";

const router = Router();

//Devuelve un log completo de un usario
//Con el count de cuantos logs
router.get("/", validateGetQuery, async (req, res) => {
  let { from, to, limit } = req.query;
  let fromTime = null
  let toTime = null

  let logUser = await getLog(req.targetUser._id);

  if (from)
    fromTime = from.getTime()
  if (to)
    toTime = to.getTime()  

  if (fromTime || toTime) {
    logUser.log = logUser.log.filter((logObject) => {
      const logDate = new Date(logObject.date); //.date es un string
      const logTime = logDate.getTime();

      if (from && !(logTime - fromTime >= 0)) return false;
      if (to && !(toTime - logTime >= 0)) return false;

      return true;
    });
  }

  if (limit) logUser.log = logUser.log.slice(0, limit);
  logUser.updateCount()

  logUser = await logUser.addUsername();

  res.send(logUser);
});

export default router;
