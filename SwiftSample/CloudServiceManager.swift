//
//  CloudServiceManager.swift
//  SwiftSample
//
//  Created by Wenbin Zhang on 6/5/14.
//  Copyright (c) 2014 Wenbin Zhang. All rights reserved.
//

import Foundation
import CloudKit

enum CloudServiceManagerError: Int {
    case Unknown
    case NoAccount
    case Restricted
}

@class_protocol protocol CloudServiceManagerDelegate {
    func cloudServiceManagerDidFinishSetup()
    func cloudServiceManagerDidFinishSetupWithError(error: CloudServiceManagerError)
}

class CloudServiceManager {
    
    var container: CKContainer? = nil
    var publicDatabase: CKDatabase? = nil
    var privateDatabase: CKDatabase? = nil
    
    weak var delegate: CloudServiceManagerDelegate?
    
    struct SingleInstance {
        static let sharedInstance: CloudServiceManager = {
            let instance: CloudServiceManager = CloudServiceManager()
            return instance
        }()
    }
    
    class var sharedInstance: CloudServiceManager {
        get {
            return SingleInstance.sharedInstance
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
                self.delegate?.cloudServiceManagerDidFinishSetup()
                
            case .NoAccount:
                self.delegate?.cloudServiceManagerDidFinishSetupWithError(CloudServiceManagerError.NoAccount)
                
            case .Restricted:
                self.delegate?.cloudServiceManagerDidFinishSetupWithError(CloudServiceManagerError.Restricted)
                
            default:
                self.delegate?.cloudServiceManagerDidFinishSetupWithError(CloudServiceManagerError.Unknown)
            }
            })
    }
}