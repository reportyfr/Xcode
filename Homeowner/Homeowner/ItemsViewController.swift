//
//  ItemsViewController.swift
//  Homeowner
//
//  Created by teacher on 10/18/16.
//  Copyright © 2016 Syracuse University. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    

    let titles = ["Cheap", "Expensive"]
    
    //store the last cell
    var lastSection : Int {
        return tableView.numberOfSections - 1
    }
    //store the last row of last section that has been modified
    var lastRowLastSection : Int {
        return tableView.numberOfRows(inSection: lastSection) - 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set contentInset for tableView
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        
        tableView.estimatedRowHeight = 65
        
        //print("font: \(UIApplication.shared.preferredContentSizeCategory)")
    }
    
    //IBAction for "Add" button
    @IBAction func addNewItem(_ button: UIButton) {
        let newItem = itemStore.createItem()
        
        // add a item to the first section cheap items
        //according the value to put it into different dections
        if (newItem.valueInDollars < 50) {
            let index = itemStore.allItems[0].index(of: newItem)
            let indexPath = IndexPath(row: index!, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        else {
            let index2 = itemStore.allItems[1].index(of: newItem)
            let indexPath2 = IndexPath(row: index2!, section: 1)
            tableView.insertRows(at: [indexPath2], with: .automatic)
            
        }
    }
    
    //IBAction for "Edit" button
    @IBAction func toggleEditingMode(_ button: UIButton) {
        
        if isEditing {
            setEditing(false, animated: true)
            button.setTitle("Edit", for: UIControlState())
        }
        else {
            setEditing(true, animated: true)
            button.setTitle("Done", for: UIControlState())
        }
    }
    
    //Asks the data source to commit the insertion or deletion of a specified row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.section][indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure?"
            
            //UIAlertController
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            //Cancel Action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            //Delete Action
            let deleteAction = UIAlertAction(title: "Delete",
                                             style: .destructive,
                                             handler: {(delete) -> Void in
                                                self.itemStore.removeItem(item)
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
            
            
            
        }
    }
    
    
    //Tells the data source that a row at a specific location (sourceIndexPath) in the table view was moved to another location (destinationIndexPath). Model objects can be updated, if needed.
    //Implemenation of this function enables row reordering controls to appear in the tableView
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    //Asks the delegate to return a new index path to retarget a proposed move of a row.
    //This function can be used to control row move attempts by the user
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        // make it so the user  cannot move an item past the no more items cell
        if proposedDestinationIndexPath.row == lastRowLastSection {
            return sourceIndexPath
        }
        // make it so the user cannot move an item within another section
        else if proposedDestinationIndexPath.section != sourceIndexPath.section  {
            return sourceIndexPath
        }
        else {
            return proposedDestinationIndexPath

        }
        
    }
    
    //Asks the data source to return the number of sections in the table view.
    override func numberOfSections(in tableView: UITableView) -> Int {
        //  total number of sections is 2
        return 2
    }
    
    //Asks the data source to return the number of rows in a given section of a table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // section 0 means "cheap"
        if section == 0 {
            return itemStore.allItems[0].count
        }
        // section 1 means "expensive"
        else if section == 1  {
            return itemStore.allItems[1].count
        }
        return itemStore.allItems.count
    }
 
    
    //Asks the data source for a cell to insert in a particular location of the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // check if the section is the last section and if the row is the last row in the last section
        if indexPath.section == lastSection && indexPath.row == lastRowLastSection {
            
            let endCell = tableView.dequeueReusableCell(withIdentifier: "LastCell", for: indexPath)
            endCell.textLabel?.text = "No more items"   // show there is no more items
            
            //make the message list in the center of the line
            endCell.textLabel?.textAlignment = .center

            return endCell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.updateLabels() //sets the fonts of the labels
        
        let item = itemStore.allItems[indexPath.section][indexPath.row]
        
        // switch case statement for section 0 and 1 populate the cell
        switch (indexPath.section) {
        case 0:
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
        case 1:
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
        default:
            cell.textLabel?.text = ""
        }
        
        
        return cell
        
        
    }
    
    // cheap and expensive title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section < titles.count {
            return titles[section]
        }
        
        return nil
    }
    
    // make it so the custom cell is not editable
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == lastRowLastSection && indexPath.section == lastSection {
            return false
        } else {
            return true
        }
    }
    
    
    // change the delete button to remove instead
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    
}
