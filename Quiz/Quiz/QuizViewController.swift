//
//  QuizViewController.swift
//  Quiz
//
//  Created by Swastik Brahma on 1/26/17.
//  Copyright © 2017 Syracuse University. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //IBOutlet for Question Label
    @IBOutlet var questionLabel: UILabel!
    
    //IBOutlet for Answer Label
    @IBOutlet var answerLabel: UILabel!
    
    //Array containing questions
    let questions = ["What is the capital of New York?",
                     "What is the capital of California?",
                     "What is the caipital of Florida?",
                     "What is the capital of Pennsylvania?"]
    
    //Array containing answers
    let answers: [String] = ["Albany",
                             "Sacramento",
                             "Tallahassee",
                             "Harrisburg"]
    
    //stores current index for questions (and answers)
    var currentQuestionIndex = 0
    
    //viewDidLoad() is called when the view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
    }
    
    //IBAction for Next Question button
    @IBAction func showNextQuestion(_ button: UIButton) {
        //print("Next Question button pressed.")
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
    }
    
    //IBAction for Show Answer button
    @IBAction func showAnswer(_ button: UIButton) {
        //print("Show Answer button pressed.")
        answerLabel.text = answers[currentQuestionIndex]
        
    }
}
