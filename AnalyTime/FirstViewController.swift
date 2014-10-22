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
           
        
    }
    override func viewWillAppear(animated: Bool) {
        
        var startDate = NSDate().dateByAddingTimeInterval(-999998)
        var endDate = NSDate()
        var ev = Events(startDate: startDate, endDate: endDate)
        ev.simpleDescription()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

