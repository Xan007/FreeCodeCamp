import { Router } from "express";
import { checkDateParam } from "../validators/dateValidator.js";

const router = Router()

const getJSONDate = (date) => {
    return {
        "unix": date.getTime(),
        "utc": date.toUTCString()
    }
}

router.get("/", async(req, res) => {
    res.json(getJSONDate(new Date()))
})

router.get("/:date", checkDateParam, async(req, res) => {
    const { date } = req.params

    res.json(getJSONDate(date))
})

export default router