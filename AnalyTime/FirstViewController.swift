//
//  FirstViewController.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/17/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI


class FirstViewController: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
    
        //accessing the event store
        var eventStore = EKEventStore();
        eventStore.requestAccessToEntityType(EKEntityTypeEvent) {
            (success: Bool, error: NSError!) in
            println("Got permission = \(success); error = \(error)")
        }
        
        //accessing calendars, we use "nil" below means all calendars
        var eventCalendars = eventStore.calendarsForEntityType(EKEntityMaskEvent) as [EKCalendar]
        
        //accessing events
        var startDate = NSDate().dateByAddingTimeInterval(-999998);
        var endDate = NSDate();
        var predicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil);
        var events = eventStore.eventsMatchingPredicate(predicate);
    
        var event = events[3] as EKEvent
        println(event.startDate)
        println(event.endDate)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

