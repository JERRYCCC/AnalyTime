//
//  EventCollecting.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/21/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import Foundation
import EventKitUI


class Events{
    
    var events: [EKEvent] = []
    var typeList: [String] = ["Work", "Study", "Fun"]
    
    init(startDate: NSDate, endDate: NSDate){
        
        //accessing the event store
        var eventStore = EKEventStore()
        eventStore.requestAccessToEntityType(EKEntityTypeEvent){
            (success: Bool, error: NSError!) in
            println("Got permission = \(success); error = \(error)")
        }
        
        //accessing calendars, we use "nil" below means all calendars
        var eventCalendars = eventStore.calendarsForEntityType(EKEntityMaskEvent) as [EKCalendar]
        
        //accessing events
        var predicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil);
        events = eventStore.eventsMatchingPredicate(predicate) as [EKEvent];
    }
    
    func simpleDescription() {
        println(events.count)
        for event in events{
            println(event)
        }
    }
}

class categerizedEvents{
    
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
    
}