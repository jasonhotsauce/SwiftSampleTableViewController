//
//  AddItemTableViewController.swift
//  SwiftSample
//
//  Created by Wenbin Zhang on 6/6/14.
//  Copyright (c) 2014 Wenbin Zhang. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneAddingItem:");
    }
    
    func doneAddingItem(sender:AnyObject) {
        println("done adding")
    }
    
}