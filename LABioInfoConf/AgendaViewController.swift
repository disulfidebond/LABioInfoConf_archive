//
//  AgendaViewController.swift
//  BioInfo Conf App
//
//  Created by John on 3/15/15.
//  Copyright (c) 2015 John. All rights reserved.
//

import Foundation
import UIKit

class ViewController : UIViewController, UITableViewDataSource {
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .Plain)
        if let agendaTableView = tableView{
            agendaTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCellID")
            agendaTableView.dataSource = self
            agendaTableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
            view.addSubview(agendaTableView)
        }
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return conferenceSessionsDayOne.count
        case 1:
            return conferenceSessionsDayTwo.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCellID", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {
            let cellInRow = conferenceSessionsDayOne[indexPath.row] as AgendaObject
            cell.textLabel?.text = cellInRow.name
        } else if indexPath.section == 1 {
            let cellInRow = conferenceSessionsDayTwo[indexPath.row] as AgendaObject
            cell.textLabel?.text = cellInRow.name
        } else {
            cell.textLabel?.text = "Open Session"
        }
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    

}
