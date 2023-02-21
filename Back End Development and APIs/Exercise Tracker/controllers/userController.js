import User from "../models/User.js";

export const createUser = async (userBody) => {
  const createdUser = new User(userBody);

  try {
    return await createdUser.save();
  } catch (err) {
    if (err.name === "MongoServerError" && err.code === 11000) {
      return await getUserByUsername(userBody.username);
    }
    throw new Error(err);
  }
};

export const getAllUsers = async () => {
  return await User.find({}).select("-__v");
};

export const getUserById = async (userId) => {
  return await User.findById(userId).select("-__v");
};

export const getUserByUsername = async (username) => {
  return await User.findOne({ username: username }).select("-__v");
};

export const getUsernameFromId = async (userId) => {
  return (await getUserById(userId)).username
};
