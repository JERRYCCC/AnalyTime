//
//  SecondViewController.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/17/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import UIKit
import EventKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var segmentControl : UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    
    var typeName: NSString = ""
    var totalEventList: [EKEvent] = []
    var typeDic: [String: Type] = [ : ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*****   setting up the segment control    "typeList"  in Type.swift    *****/
        segmentControl.removeAllSegments()
        for(var i=0; i<typeNameList.count; i++){
            segmentControl.insertSegmentWithTitle(typeNameList[i], atIndex: i, animated: true)
        }
        segmentControl.insertSegmentWithTitle("Total", atIndex: 0, animated: true)
        segmentControl.selectedSegmentIndex = 0
        typeName = segmentControl.titleForSegmentAtIndex(segmentControl.selectedSegmentIndex)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        /*****    collect events from the calendar    *****/
        //accessing the event store
        eventStore.requestAccessToEntityType(EKEntityTypeEvent){
            (success: Bool, error: NSError!) in
            println("Got permission = \(success); error = \(error)")
        }
        
        //accessing calendars, we use "nil" below means all calendars and get the event list
        var eventCalendars = eventStore.calendarsForEntityType(EKEntityMaskEvent) as [EKCalendar]
        
        var predicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil);
        totalEventList = eventStore.eventsMatchingPredicate(predicate) as [EKEvent]!
        println(totalEventList.count)
        
        //building up the event dictionary   [typeName: eventType]
        for typeName in typeNameList {
            var tempType: Type = Type(name: typeName)
            typeDic.updateValue(tempType, forKey: typeName)
        }
        
        //add events into the dictionary
        for event in totalEventList{
            typeDic[event.notes]!.addEvent(event)
        }
        
        var labelString: String = ""
        for typeName in typeNameList{
            labelString += typeName + "   " + "\(typeDic[typeName]!.getTotalTimeInterval())" + " mins" + "\n"
        }
        label.numberOfLines = 0
        label.text = labelString
        
        
        
    }

    @IBAction func segmentTap (){
        typeName = segmentControl.titleForSegmentAtIndex(segmentControl.selectedSegmentIndex)!
        println(typeName)
    }
}

