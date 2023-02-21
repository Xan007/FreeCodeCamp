import { Router } from "express";

import { getAllUsers, createUser } from "../controllers/userController.js";

const router = Router();

//Obtener todos los usuarios
//Devuelve un array
//Cada uno contiene el usuario
router.get("/", async (req, res) => {
  res.send(await getAllUsers());
});

//Devuelve un objeto username e _id
router.post("/", async (req, res) => {
  const { username } = req.body;
  
  try {
    let user = await createUser({ username: username })
    user = user.toObject()
    delete user.__v

    res.send(user)
  } catch (err) {
    res.status(400).send(`${err}`);
  }
});

export default router;
