import { Router } from "express";

import exercises from "../routes/exercises.js";
import logs from "../routes/logs.js";
import users from "../routes/users.js";

import { getUserMiddleware } from "../middleware/userMiddleware.js"

const router = Router();

router.use("/api/users/", users);
router.use("/api/users/:_id/exercises", getUserMiddleware, exercises);
router.use("/api/users/:_id/logs", getUserMiddleware, logs);

export default router;
