import { getUserById } from "../controllers/userController.js";

export const getUserMiddleware = async (req, res, next) => {
  const { _id } = req.params;
  try {
    const user = await getUserById(_id);

    if (!user) throw new Error(`No se encontró un usuario con la id: ${_id}`);

    req.targetUser = user;
    next();
  } catch (err) {
    res.status(400).send(`${err}`);
  }
};
