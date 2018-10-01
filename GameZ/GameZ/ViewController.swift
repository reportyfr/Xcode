//
//  ViewController.swift
//  GameZ
//
//  Created by My Pham on 10/6/16.
//  Copyright © 2016 My Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet var expressionLabel : UILabel! // make a expression label
    
    @IBOutlet var scoreLabel : UILabel! // the users score correct/incorrect
    
    @IBOutlet var playButton : UIButton!    // make a play button
    @IBOutlet var solveButton : UIButton!   // make a solution button
    
    @IBOutlet var text : UITextField! // make a textfield outlet
    
    // keep the two random values as optinal int
    var randomVal1 : Int?
    var randomVal2 : Int?
    
    var arithmeticOperator = ["+","-","*"] // keep arithmetic operations in an array
    
    // computes the answer by using the function computation
    var answer: Int? {

        didSet {
            computation()
        }

    }
    
    // store the answer into a string
    var ans : String?
    
    override func viewDidLoad() // when it first loads set the labels to initial state
    {
        super.viewDidLoad()
        
        // call a function to make all the random values and compute the answer
        randomValuesOperator()
        
    }
    
    @IBAction func playPressed(_ button: UIButton) {
        
        // redo all the random values and set a new operator for the user to see
        randomValuesOperator()
        text.text = ""  // reset the textfield
    }
    
    // when the solve button is pressed the answer is computed
    @IBAction func solvePressed(_ button: UIButton) {

        if let value = Int(text.text!) {
            answer = value
        }
        else {
            answer = nil
        }
    
    }
    
    // when the user taps the background the answer is computed
    @IBAction func userTappedTheBackground(_ gestureRecognizer: UIGestureRecognizer) {
        
        // this gets rid of the keyboard when the user hits the background
        text.resignFirstResponder()
        
        if let value = Int(text.text!) {
            answer = value
        }
        else {
            answer = nil
        }
        
    }
    
     // when the user hits the return key the answer is computed
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // this gets rid of the keyboard when the return is clicked
        text.resignFirstResponder()
        
        if let value = Int(text.text!) {
            answer = value
        }
        else {
            answer = nil
        }
     
        return true
    }
    
    
    // check the textifled and not allow the user to enter 0 if it isn't the answer
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if(ans == String(0)) {
            return true
        }
        if(text.text == "" && string == "0"){
            return false
        }
        return true
    }
    
    // the function that does all the computation and holds the answer
    func computation() {
                
                // if any of them match the answer then correct will display with the color of green
                if(text.text == ans!)
                {
                    scoreLabel.textColor = UIColor.green
                    scoreLabel.text =  "CORRECT"
                }
                // when the placeholder is shown, dont have a score of anything
                else if(text.text == "") {
                    scoreLabel.text = ""
                }
                // otherwise if none of the user's answer matches it will display incorrect with red color
                else {
                    scoreLabel.textColor = UIColor.red
                    scoreLabel.text = "INCORRECT"
                    
                }
    }
    
    // compute all the random variables into a function
    func randomValuesOperator() {
        
        randomVal1 = Int (arc4random_uniform(10) + 1)           // random value from one to ten
        randomVal2 = Int (arc4random_uniform(10) + 1)
        let op = arithmeticOperator[Int(arc4random_uniform(3))] // random operator from one to three
        
        switch (op){
        case "+":
            ans = String(randomVal1! + randomVal2!)
        case "-":
            ans = String(randomVal1! - randomVal2!)
        case "*":
            ans = String(randomVal1! * randomVal2!)
        default:
            break
        }
        
        expressionLabel.text = "\(randomVal1!) \(op) \(randomVal2!)" // change the label to show the user
        scoreLabel.text = ""                // initially the score is empty
    }

}

