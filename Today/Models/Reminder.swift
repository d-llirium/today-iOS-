//
//  Reminder.swift
//  Today
//
//  Created by user on 10/05/22.
//

import Foundation

struct Reminder
{
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

#if DEBUG //  is a compilation directive that prevents the enclosed code from compiling when you build the app for release. You can use this flag for testing code in debug builds — or for providing sample test data, like you’ll do in the next step.
extension Reminder
{
    static var sampleData =
    [
        Reminder(
            title: "Get my glasses"
            , dueDate: Date().addingTimeInterval(
                800.0 )
            , notes: "You have to pay for the service R$45.00"
            , isComplete: true
        )
        , Reminder(
            title: "Transfer the light bill"
            , dueDate: Date().addingTimeInterval(
                14000.0 )
            , notes: "try doing from the website"
        )
        , Reminder(
            title: "Practice clean code"
            , dueDate: Date().addingTimeInterval(
                6000000.0 )
            , notes: "project claculator IMC"
        )
        , Reminder(
            title: "go to the clinic"
            , dueDate: Date().addingTimeInterval(
                19000.0 )
            , notes: "make sure you have your documents"
        )
        , Reminder(
            title: "Game Presentation"
            , dueDate: Date().addingTimeInterval(
                200000.0 ),
            notes: "get your shit together"
            , isComplete: true
        )
    ]
}
#endif
