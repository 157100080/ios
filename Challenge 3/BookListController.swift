//
//  BookListController.swift
//  Stack
//
//  Created by itst on 23/2/2016.
//  Copyright © 2016 IVE. All rights reserved.
//

import UIKit
import CoreData
class BookListController: UITableViewController {
    var foodArray = [FoodSummary]()
    var order = [orderSummary]()
    var managedObjectContext: NSManagedObjectContext?
    
    @IBAction func addItem(sender: UIButton) {
        let alert = UIAlertController(title: "order", message: "Type the number", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!)in
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler: {
            (action) -> Void in
            if let number = alert.textFields{
                if let amount = number[0].text{
                    let o = orderSummary(title: self.foodArray[sender.tag].title, price: self.foodArray[sender.tag].price, amount: Int(amount)!)
                    orderArray.order.append(o)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert,animated: true, completion: nil)
    }
    func searchItems(){
        let fetchRequest = NSFetchRequest(entityName: "Entity")
        do{
            if let fetchResult = try! self.managedObjectContext?.executeFetchRequest(fetchRequest) as? [Entity]{
                orderArray.allOrder = fetchResult
                
            }
        }
        
    }
   // @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshData()
        searchItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.foodArray.count;
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
       // let cell = tableView.dequeueReusableCellWithIdentifier("BookItem", forIndexPath: indexPath) as UITableViewCell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCellController
        cell.btn.tag = indexPath.row;
            let foodSummary = foodArray[indexPath.row]
            cell.title.text = foodSummary.title
            cell.price.text = "$\(foodSummary.price)"
            cell.img.image = UIImage(named: foodSummary.img)
        return cell
    }
    
    func refreshData(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        FoodList.getBooks({(foods: Array<FoodSummary>) in
            for food in foods {
                print(food.title)
            }
            self.foodArray = foods
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            })
            
            
        })
    }
    
    /*func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
        
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
  
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        /*if let destination = segue.destinationViewController as? DetailController{
            print("we are about to view a detailController")
            let indexPath = self.tableView.indexPathForSelectedRow
            if let row:Int = indexPath?.row{
                print("row\(row)")
                /*let bookID = foodArray[row] as FoodSummary
                destination.bookID = bookID.id*/
            }
        }*/
        //orderArray.order = self.order
        /*if let destination = segue.destinationViewController as? OrderController{
            destination.order = self.order
           
        }*/
    }
    
    
}
