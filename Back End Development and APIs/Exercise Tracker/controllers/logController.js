import Log from "../models/Log.js";

export const initLog = async (userId) => {
  const newLog = new Log({
    _id: userId,
  });
  await newLog.save();
};

export const getLog = async (userId) => {
  return await Log.findById(userId);
};

export const addToLog = async (userId, exercise) => {
  const logUser = await getLog(userId)
  logUser.addExercise(exercise)
  logUser.updateCount()

  await logUser.save()
};
