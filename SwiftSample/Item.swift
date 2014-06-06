//
//  Item.swift
//  SwiftSample
//
//  Created by Wenbin Zhang on 6/5/14.
//  Copyright (c) 2014 Wenbin Zhang. All rights reserved.
//

import Foundation

class Item {
    var name: String!
    var startDate: NSDate!
    
    var endDate: NSDate?
    
    var finished: Bool {
    get{ return self.finished }
    set(isFinished) {
        self.finished = isFinished
        if finished {
            endDate = NSDate.date()
        }
    }
    
    }
    var description: NSString?
    
    init(name:String!, startDate:NSDate!, finished:Bool, description:String?) {
        self.name = name
        self.startDate = startDate
        self.finished = finished
        self.description = description
    }
}
