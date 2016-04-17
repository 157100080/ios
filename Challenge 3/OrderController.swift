

import UIKit
import CoreData

class OrderController: UITableViewController {
    //var order = [orderSummary]()
    var totalPrice: Double = 0.0;
    
    @IBOutlet weak var tp: UILabel!
    
    var managedObjectContext: NSManagedObjectContext?
   
    @IBAction func send(sender: UIButton) {
        addToOrder()
        orderArray.currentOrderId += 1;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderArray.order.count
    }

    func searchItems(){
        let fetchRequest = NSFetchRequest(entityName: "Entity")
        do{
            if let fetchResult = try! self.managedObjectContext?.executeFetchRequest(fetchRequest) as? [Entity]{
                orderArray.allOrder = fetchResult
                
            }
        }
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! OrderCellController

        // Configure the cell...
        if orderArray.order.count > 0{
            let rows = orderArray.order[indexPath.row]
            cell.title.text = rows.title
            cell.price.text = "$ \(rows.price)"
            cell.amount.text = "Amount: \(rows.amount)"
            totalPrice += rows.price * Double(rows.amount)
        }
        
        tp.text = "Total Price:$ \(totalPrice)"
        return cell
    }
    func addToOrder(){
        for o in orderArray.order{
            let newOrder:Entity = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: self.managedObjectContext!) as! Entity
            newOrder.title = o.title
            newOrder.price = o.price
            newOrder.amount = o.amount
            newOrder.time = NSDate()
            newOrder.orderid = orderArray.currentOrderId
           
        }
        orderArray.order.removeAll()
        totalPrice = 0.0
        tp.text = "Total Price:$ \(totalPrice)"
        self.tableView.reloadData()
        print("added")
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            totalPrice = 0.0
            orderArray.order.removeAtIndex(indexPath.row)

            
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.tableView.reloadData()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func viewWillDisappear(animated: Bool) {
      
    }

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

    /*// In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }*/
    

}
