import Exercise from "../models/Exercise.js"

import { addToLog } from "../controllers/logController.js"

export const initExercise = async(userId) => {
    const exerciseDoc = new Exercise({
        _id: userId
    })
    await exerciseDoc.save()
}

export const getExercise = async(userId) => {
    return await Exercise.findById(userId)
}
export const updateExercise = async(userId, exerciseBody) => {
    try {
        const updatedExercise = await Exercise.findByIdAndUpdate(userId, exerciseBody, {new: true})
        await addToLog(userId, updatedExercise)

        return updatedExercise
    } catch (err) {
        throw new Error(err)
    }
}