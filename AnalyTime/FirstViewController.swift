//
//  FirstViewController.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/17/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import UIKit
import EventKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var segmentControl : UISegmentedControl!
    @IBOutlet weak var eventTableView: UITableView!
    
    var typeName: NSString = ""
    var totalEventList: [EKEvent] = []
    var eventList: [EKEvent] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        /*****   setting up the segment control    "typeList"  in Type.swift    *****/
        segmentControl.removeAllSegments()
        for(var i=0; i<typeNameList.count; i++){
            segmentControl.insertSegmentWithTitle(typeNameList[i], atIndex: i, animated: true)
        }
        segmentControl.selectedSegmentIndex = 0
        typeName = typeNameList[segmentControl.selectedSegmentIndex]

        /*****    collect events from the calendar    *****/
        println(startDate)
        println(endDate)
   
        //accessing the event store
        eventStore.requestAccessToEntityType(EKEntityTypeEvent){
            (success: Bool, error: NSError!) in
            println("Got permission = \(success); error = \(error)")
        }
        
        //accessing calendars, we use "nil" below means all calendars and get the event list
        var eventCalendars = eventStore.calendarsForEntityType(EKEntityMaskEvent) as [EKCalendar]
        
        var predicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil);
        totalEventList = eventStore.eventsMatchingPredicate(predicate) as [EKEvent]!
        
        //filter, repeated event only appear once
        //check every event's title, if the event was in the eventList already
        //we take away the old event, and append the new one
        
        totalEventList = totalEventList.reverse()
        for event in totalEventList{
            eventList = eventList.filter({$0.title != event.title})
            eventList.append(event)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.eventTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = eventList[indexPath.row].title
        cell.detailTextLabel?.text = eventList[indexPath.row].notes
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell:UITableViewCell = self.eventTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        eventList[indexPath.row].notes = typeName;
        cell.detailTextLabel?.text = eventList[indexPath.row].notes
        
        eventStore.saveEvent(eventList[indexPath.row], span: EKSpanFutureEvents, error: NSErrorPointer())
        self.eventTableView.reloadData()
        
    }
    
    @IBAction func segmentTap (){
        typeName = typeNameList[segmentControl.selectedSegmentIndex]
        println(typeName)
    }
}


