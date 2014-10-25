//
//  Main.swift
//  AnalyTime
//
//  Created by Jerry Cai on 10/25/14.
//  Copyright (c) 2014 Jerry Cai. All rights reserved.
//

import Foundation
import EventKit

public var typeNameList: [String] = ["Work", "Study", "Fun", "Other"]

public var startDate = NSDate().dateByAddingTimeInterval(-60*60*24*5)
public var endDate = NSDate()
public var eventStore : EKEventStore = EKEventStore()

