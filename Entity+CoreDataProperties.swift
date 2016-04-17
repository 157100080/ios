//
//  Entity+CoreDataProperties.swift
//  Challenge 3
//
//  Created by itst on 11/4/2016.
//  Copyright © 2016 Coventry University. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity {

    @NSManaged var amount: NSNumber?
    @NSManaged var price: NSNumber?
    @NSManaged var time: NSDate?
    @NSManaged var title: String?
    @NSManaged var orderid: NSNumber?

}
