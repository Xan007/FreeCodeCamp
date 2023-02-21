import { Router } from "express";
import multer from "multer"

const upload = multer({ dest: 'uploads/' })

const router = Router()

router.post("/fileanalyse", upload.single("upfile"), async(req, res) => {
    const { file } = req

    res.json({
        name: file.originalname,
        type: file.mimetype,
        size: file.size
    })
})

export default router