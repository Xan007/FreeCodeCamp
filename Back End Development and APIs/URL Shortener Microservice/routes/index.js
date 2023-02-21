import { Router } from "express";

import shorturl from "./shorturl.js";

const router = Router();

router.use("/shorturl", shorturl);

export default router;
