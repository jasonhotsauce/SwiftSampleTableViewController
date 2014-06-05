//
//  CloudServiceManager.swift
//  SwiftSample
//
//  Created by Wenbin Zhang on 6/5/14.
//  Copyright (c) 2014 Wenbin Zhang. All rights reserved.
//

import Foundation
import CloudKit

class CloudServiceManager {
    
    class var sharedInstance: CloudServiceManager {
        get {
            struct StaticVar {
                static var instance: CloudServiceManager? = nil
                static var token: dispatch_once_t = 0
            }
            
            dispatch_once(&StaticVar.token, {StaticVar.instance = CloudServiceManager()})
            return StaticVar.instance!
        }
    }
    
}