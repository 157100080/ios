//
//  BookList.swift
//  Stack
//
//  Created by cpst on 26/2/15.
//  Copyright (c) 2015 cpst. All rights reserved.
//

import UIKit
struct FoodSummary{
    var title : String;
    var price: Double;
    var img: String;
    
}


class FoodList: NSObject {
    //var bookSummaries : Array<FoodSummary>;
    class var bookSummaries : Array<FoodSummary> {
        var arr : Array<FoodSummary>;
        arr = Array<FoodSummary>();
        arr.append(FoodSummary(title: "飽飽牌肉罐頭", price: 30, img: "cram"));
        arr.append(FoodSummary(title: "豬肉煮豆罐頭", price: 20, img: "pork"));
        arr.append(FoodSummary(title: "核子可樂", price: 5, img: "nuka"))
        arr.append(FoodSummary(title: "速食薯泥", price: 10, img: "mash"))
        return arr;
        
    }
    
    
    
    class func getBooks(theFunc:(books: Array<FoodSummary>)->Void){
        theFunc(books: bookSummaries);
    }
    
    
    
 
}

