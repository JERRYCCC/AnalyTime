//
//  EventDoc.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/21/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import Foundation



protocol EventProtocol{
    var title: String {get set}
    var location: String {get set}
    var startDate: NSDate {get set}
    var endDate: NSDate {get set}
    var type: Types {get set}
}

enum Types{
    case Study, Work, Rest, Food, Fun, Default
    func simpleDescription() -> String{
        switch self{
        case .Study:
            return "Study"
        case .Work:
            return "Work"
        case .Rest:
            return "Rest"
        case .Food:
            return "Food"
        case .Fun:
            return "Fun"
        default:
            return "Default"
        }
    }
}


enum Days{
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    func simpleDescription() -> String {
        switch self{
        case .Monday:
            return "Monday"
        case .Tuesday:
            return "Tuesday"
        case .Wednesday:
            return "Wednesday"
        case .Thursday:
            return "Thursday"
        case .Friday:
            return "Friday"
        case .Saturday:
            return "Saturday"
        case .Sunday:
            return "Sunday"
        }
    }
}