//
//  File.swift
//  AppCustomAlerts
//
//  Created by Raul Mantilla on 16/11/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation

struct AlertMessage {
    let title: String
    let imageName: String
    let message1: String
    let message2: String
    let actionTitle: String
}

enum AlertType {
    case courseCompleted,eatWell,missedMeal,missedWorkout,newProgramsAdded,programUpdated,restDay,itsAWorkoutDay,itsAWorkoutDay2
    var message: AlertMessage {
        switch self {
        case .courseCompleted: return AlertMessage(title: "Course Completed", imageName: "completed", message1: "Great job completing your course!", message2: "put what you've learned to good use to archive the healthy body you want!", actionTitle:"Dismiss")
        case .eatWell: return AlertMessage(title: "Eat Well", imageName: "eatWell", message1: "Preparation is the key to build good habits!", message2: "Remember to record your meals in your nutrition log & get ready to see results!", actionTitle:"Go to Your Meal Log")
        case .missedMeal: return AlertMessage(title: "Missed Meal", imageName: "missedMeal", message1: "Looks like you didn't record your meals :(", message2: "Make sure to check FitHabit daily to stay on track!", actionTitle:"Dismiss")
        case .missedWorkout: return AlertMessage(title: "Missed Workout", imageName: "missedWorkout", message1: "Looks like you missed a workout :(", message2: "Make sure to check FitHabit daily to stay on track!", actionTitle:"Dismiss")
        case .newProgramsAdded: return AlertMessage(title: "New Programs Added", imageName: "newProgramsAdded", message1: "Please check your account for new items from FitHabit", message2: "", actionTitle:"Dismiss")
        case .programUpdated: return AlertMessage(title: "Program Updated", imageName: "programUpdated", message1: "One or more of your programs have been updated by the author of the program.", message2: "Please check your account for new items", actionTitle:"Dismiss")
        case .restDay: return AlertMessage(title: "Rest Day", imageName: "restDay", message1: "Take this day to let your body recover but watch what your eat and keep your ultimate goal in mind", message2: "A healthy body is created day by day!", actionTitle:"Dismiss")
        case .itsAWorkoutDay: return AlertMessage(title: "It's A Workout Day", imageName: "itsAWorkoutDay", message1: "It's the end of another week!", message2: "Keep track of your fitness goals by updating your weight & boidy fat information in your profile.", actionTitle:"Go to your profile")
         case .itsAWorkoutDay2: return AlertMessage(title: "It's A Workout Day", imageName: "itsAWorkoutDay2", message1: "Preparation is the key to build good habits!", message2: "Remember to charge your smarthphone & prepare your gear before you get to the gym", actionTitle:"Go to Todays Workout")
        }
    }
}
