//
//  ViewController.swift
//  Fibonacci
///Users/swastikbrahma/Documents/Spring 2017/Developer/Fibonacci/BlackboardUpload/Fibonacci/Fibonacci/AppDelegate.swift
//  Created by Swastik Brahma on 1/19/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlet for the UILabel that displays the Fibonacci sequence
    @IBOutlet var nextNumberLabel: UILabel!
    
    //first is an Optional Int
    var first: Int!
    
    //second is an Optional Int
    var second: Int!
    
    //nextNumber is a Computed Property
    var nextNumber: Int! {
        let newNumber = add(first, y: second)
        first = second
        second = newNumber
        return newNumber
    }
    
    //viewDidLoad() is invoked when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first = 0
        second = 1
        
        print("viewDidLoad() called.")
        //print(first!)
        
        //printOptionalInt(first)
        //printOptionalInt(second)
        
        //print(first)
        //print(second)
        
//        let sum = add(first, y: second)
//        printOptionalInt(sum)
        
//        for _ in 1..<11 {
//           // printOptionalInt(nextNumber)
//            print(nextNumber)
//        }
    }
    
    //IBAction for the "Next" button (invoked when the "Next" button is pressed)
    @IBAction func showNextNumber(_ button: UIButton) {
        print("Button pressed.")
        
        nextNumberLabel.text = nextNumberLabel.text! + ", " + "\(nextNumber)"
    }
    
//    func printOptionalInt(x: Int?) -> Void {
//        if let value = x {
//            print(value)
//        }
//        else {
//            print(x)
//        }
//    }
    
    //add() adds two Optional Ints and returns the result
    func add(_ x: Int?, y: Int?) -> Int? {
        if let value1 = x, let value2 = y {
                return value1 + value2
            
        }
        
        return nil
    }
    
//    func getNextNumber() -> Int? {
//        let newNumber = add(first, y: second)
//        
//        first = second
//        second = newNumber
//        return newNumber
//    }
}









