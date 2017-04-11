//
//  AgendaSplashTableViewController.swift
//  BioInfo Conf App
//
//  Created by John on 3/10/15.
//  Copyright (c) 2015 John. All rights reserved.
//


import UIKit

class AgendaSplashTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return conferenceSessionsDayOne.count
        case 1:
            return conferenceSessionsDayTwo.count
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCellID", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {
            let cellInRow = conferenceSessionsDayOne[indexPath.row] as AgendaObject
            cell.textLabel?.text = cellInRow.name
            cell.detailTextLabel?.text = cellInRow.time
        } else if indexPath.section == 1 {
            let cellInRow = conferenceSessionsDayTwo[indexPath.row] as AgendaObject
            cell.textLabel?.text = cellInRow.name
            cell.detailTextLabel?.text = cellInRow.time
        } else {
            cell.textLabel?.text = "Open Session"
        }
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        // ??
    }
    
    func newLabelWithTitle(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.backgroundColor = UIColor.lightGrayColor()
        label.sizeToFit()
        return label
    }
    
    func newViewForHeaderOfFooterWithText(text: String) -> UIView {
        let headerLabel = newLabelWithTitle(text)
        
        headerLabel.frame.origin.x += 10
        headerLabel.frame.origin.y = 5
        let resultFrame = CGRect(x:0, y: 0, width: headerLabel.frame.size.width + 10, height: headerLabel.frame.size.height)
        
        let headerView = UIView(frame: resultFrame)
        headerView.addSubview(headerLabel)
        return headerView
    
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection sectin: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if section == 0 {
            return newLabelWithTitle("                  Day One Sessions")
        } else if section == 1 {
            return newLabelWithTitle("                  Day Two Sessions")
        } else {
            return newLabelWithTitle("Unplanned Sessions")
        }
    }
    

    // implement these sections when exact agenda is known
    /*
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("firstSpeakerSegue", sender: tableView)
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
