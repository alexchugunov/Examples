//
//  AutoLayoutTableViewController.swift
//  TableViewAutoLayoutExample
//
//  Created by Alex Chugunov on 3/1/15.
//
//

import UIKit

class AutoLayoutTableViewController: UITableViewController {
    var sizingCellWidthConstraint: NSLayoutConstraint?
    
    lazy var sizingCell: AutoLayoutCell? = {
        var cell: AutoLayoutCell = UINib(nibName: "AutoLayoutCell", bundle: NSBundle.mainBundle()).instantiateWithOwner(self, options: nil).first as AutoLayoutCell;
        var widthConstraint = NSLayoutConstraint(item: cell.contentView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 320.0)
        widthConstraint.priority = 750
        cell.contentView.addConstraint(widthConstraint)
        self.sizingCellWidthConstraint = widthConstraint
        return cell
    }()
    
    let titles = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "Ut et tortor id odio eleifend tempus.",
        "Proin et lectus ullamcorper diam convallis congue.",
        "Nullam vel sem sit amet mauris eleifend posuere.",
        "Integer vehicula ex id viverra interdum.",
        "Donec efficitur sem eu nisl facilisis, eget feugiat purus tempus.",
        "Suspendisse blandit lacus eget ligula vehicula, at hendrerit tellus ullamcorper.",
        "Suspendisse condimentum enim ac sdkafjk lsdjfksjd fkjlturpis sfasdfsadkfj ksadfj ksjfklajasdkl fj consequat, eget euismod elit dapibus.",
        "Ut vehicula mauris vitae tincidunt commodo.",
        "Quisque molestie dui quis felis rhoncus, sit amet condimentum tortor interdum.",
        "Vestibulum volutpat arcu non urna tempor, vel blandit sem rhoncus.",
        "Duis eget nulla vitae velit feugiat rhoncus et sit amet eros.",
        "In auctor mi non elit pretium, vel accumsan justo euismod.",
        "Nam scelerisque enim sit amet ante mollis, eget hendrerit ligula tincidunt.",
        "Proin id massa volutpat, lobortis turpis et, ornare diam.",
        "Aliquam malesuada augue in lectus posuere, id faucibus risus ultrices."]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "AutoLayoutCell", bundle: nil), forCellReuseIdentifier: "AutoLayoutCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AutoLayoutCell", forIndexPath: indexPath) as AutoLayoutCell
        cell.setTitle(titles[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        sizingCellWidthConstraint?.constant = tableView.bounds.size.width;
        sizingCell!.setTitle(titles[indexPath.row])
        var size = sizingCell!.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize);
        
        return size.height;
    }

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
