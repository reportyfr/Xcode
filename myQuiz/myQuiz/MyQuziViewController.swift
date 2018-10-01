//
//  ViewController.swift
//  myQuiz
//
//  Created by Junhua Chen on 2017/2/8.
//  Copyright © 2017年 Junhua Chen. All rights reserved.
//

import UIKit

class MyQuizViewController: UIViewController {

    
    @IBOutlet weak var expressionLabel: UILabel!           //the outlet of expression label
    @IBOutlet weak var solutionLabel: UILabel!             //the putlet of solution label
    @IBOutlet weak var playButton: UIButton!               //we will change the title of this button, so we need a outlet here
    @IBOutlet weak var solveButton: UIButton!              //the outlet of solve button
    var firstNum : Int?                                    //the first addend, type is optinoal
    var secondNum : Int?                                   //the second addend, type is optional
    //var countofPlayButtonPressed = 0                     
    //count how many times user have pressed the play button, but actually we don't need to use it here, since once you press the button, the title changes
    
    //the function when user press the solve button
    @IBAction func userPressSolveButton(_ sender: UIButton) {
        if let result = addTwoNum(x: firstNum, y: secondNum){
            solutionLabel.text = "\(result)"
        }
        //if we cannot calculate the value, the solution label will continue displaying solution
        else{
            solutionLabel.text = "Solution"
        }
    }
    
    //the function when user press the play button
    @IBAction func usePressplayButton(_ sender: UIButton) {
        //first we should generate two random integer number, use arc4random_uniform()
        //the two number can be nil, so we should set them to be optional
        firstNum = Int(arc4random_uniform(100))
        secondNum = Int(arc4random_uniform(100))
        if let first = firstNum, let second = secondNum{
            expressionLabel.text = "\(first)"+"   ✚   "+"\(second)"
        }
        //if the value are not initialied for some unknown reason
        else{
            expressionLabel.text = "ERROR! Please try again!"
        }
        
        //set the play button title to play again
        playButton.setTitle("Play Again", for: .normal)
        //set the solution label title to "?"
        solutionLabel.text = "?"
    }
    
    
    //this func will calculate the value of two number
    func addTwoNum(x:Int?, y:Int?) -> Int? {
        if let value1 = x, let value2 = y {
            //return the sum of the two number
            return value1 + value2
        
        }
        //if we cannot calculate the value due to some reason, wewilll return nil, that's why we should set the value to be optional
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
        //set the attributes of the label and button when view is loaded
        expressionLabel.text = "Expression"
        solutionLabel.text = "Solution"
        playButton.setTitle("Play", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

