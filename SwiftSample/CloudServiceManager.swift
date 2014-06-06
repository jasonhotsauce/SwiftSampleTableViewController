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
    
    var container: CKContainer? = nil
    var publicDatabase: CKDatabase? = nil
    var privateDatabase: CKDatabase? = nil
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
    
    func setupCloud() {
        container = CKContainer.defaultContainer()
        publicDatabase = container?.publicCloudDatabase
        container?.accountStatusWithCompletionHandler({status, error in
            if error {
                println("error accessing private database: \(error)")
            }
            
            switch status {
            case .Available:
                self.privateDatabase = self.container?.privateCloudDatabase
                
            case .NoAccount:
                println("NO ACCOUNT")
                
            case .Restricted:
                println("RESTRICTED")
                
            default:
                println("UNKNOWN")
            }
            })
    }
}