//
//  ItemStore.swift
//  Homeowner
//
//  Created by teacher on 10/18/16.
//  Copyright © 2016 Syracuse University. All rights reserved.
//

import UIKit

class ItemStore {
    // recreate into a 2d array
    var allItems = [[Item]]()
    
    // initialize the array because they would be empty
    init() {
        
        // append an item to the two sections
        allItems.append([Item]())                           //section1
        allItems.append([Item]())                           //section2
        
        // add "No more items" in section 2
        allItems[1].append(Item(random: false))
    }
    
    //function to create an item
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        // check the new item, compare it with 50
        if (newItem.valueInDollars < 50) {
            allItems[0].append(newItem)
        }
        else if(newItem.valueInDollars >= 50) {
            //cause we have a last item show the message "no more items", we should insert the item before that item instaed of appending the new item to the array
            allItems[1].insert(newItem, at: allItems[1].count-1)
        }
        
        return newItem
    }
    
    //function to remove specified item from the array
    func removeItem(_ item: Item) {
        //if it exists in section 1
        if let index = allItems[0].index(of: item) {
            allItems[0].remove(at: index)
        }
        //if it exists in section 2
        if let index = allItems[1].index(of: item) {
            allItems[1].remove(at: index)
        }
    }
    
    //function to reorder an item in the array
    func moveItem(_ fromIndex: Int, toIndex: Int) {
        
        if fromIndex == toIndex {
            return
        }
        
        // move an item from the first section
        if (allItems[0][fromIndex].valueInDollars < 50) {
        let movedItem1 = allItems[0][fromIndex]
        
        allItems[0].remove(at: fromIndex)
        
        allItems[0].insert(movedItem1, at: toIndex)
        }
        
        // move an item from the second section
        else if (allItems[1][fromIndex].valueInDollars > 50) {
        let movedItem2 = allItems[1][fromIndex]
        
        allItems[1].remove(at: fromIndex)
        
        allItems[1].insert(movedItem2, at: toIndex)
        
        }
    }
    
    //function to print all items in the array
    /*
    func printAllItems() {
        for i in 0...4 {
            print("name: \(allItems[i].name) value: \(allItems[i].valueInDollars) SN: \(allItems[i].serialNumber)")
        }
    }
 */
}
