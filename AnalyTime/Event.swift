//
//  Event.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/21/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import Foundation

class Event: EventProtocol{
    
    var title, location : String
    var startDate, endDate : NSDate
    var type : Types
    
    init(title: String, location: String, startDate: NSDate, endDate: NSDate){
        self.title = title
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
        self.type = Types.Default
    }
}
