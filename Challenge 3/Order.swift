

import UIKit
import CoreData
struct orderSummary{
    var title : String;
    var price: Double;
    var amount: Int;
    
}
struct orderArray {
    static var order = [orderSummary]()
    static var allOrder = [Entity]()
    static var currentOrderId = 0
}
