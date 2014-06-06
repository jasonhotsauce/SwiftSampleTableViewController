//
//  ViewController.swift
//  SwiftSample
//
//  Created by Wenbin Zhang on 6/3/14.
//  Copyright (c) 2014 Wenbin Zhang. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var addButton : UIBarButtonItem
    var countryList : String[] = ["USA", "CHINA", "ENGLAND", "INDIA", "CANADA"]
    let cellReuseIdentifier : String = "cell"
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibName, bundle: nibBundle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView : UITableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: self.cellReuseIdentifier)
        view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        
    }

    @IBAction func addButtonTapped(sender:AnyObject) {
        if CloudServiceManager.sharedInstance.publicDatabase {
            self.performSegueWithIdentifier("presentAddItemView", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: self.cellReuseIdentifier)
        }
        
        cell.text = "Row: \(countryList[indexPath.row])"
        
        return cell
    }
}

