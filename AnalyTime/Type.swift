//
//  Type.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/25/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import Foundation
import EventKit

class Type{
    
    var events : [EKEvent] = []
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func addEvent(event: EKEvent){
        events.append(event)
    }
    
    func getEvents() -> [EKEvent]{
        return events
    }
    
    func countEvents() -> Int{
        return events.count
    }
    
    func getTotalTimeInterval() -> NSTimeInterval{
        var totalInterval : NSTimeInterval = 0
        
        for event in events{
            var tempInterval = event.endDate.timeIntervalSinceDate(event.startDate)
            totalInterval += tempInterval
        }
        //minutes
        return totalInterval/60
    }
}