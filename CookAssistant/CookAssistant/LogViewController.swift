//
//  ViewController.swift
//  CookAssistant
//
//  Created by reportyfr on 4/25/17.
//  Copyright © 2017 Syracuse. All rights reserved.
//

import UIKit

class LogViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func confirmOrRegisterButtonPressed(_ sender: UIButton) {
        //OK pressed
        if(sender.currentTitle == "OK")
        {
            //print("OK pressed")
            if let username = usernameField.text
            {
                if let passwd = passwordField.text
                {
                    //check the username and password here
                    if (username=="" && passwd==""){
                        performSegue(withIdentifier: "showMainPage", sender: self)
                        //print("allow segue")
                    }
                }
            }
        }
        //register pressed
        else if(sender.currentTitle == "Forget Password?"){
            //print("Forget Password pressed")
        }
        else{
            //print("register pressed")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // when the user taps the background the answer is computed
    @IBAction func userTappedTheBackground(_ gestureRecognizer: UIGestureRecognizer) {
        
        // this gets rid of the keyboard when the user hits the background
        if(usernameField.isFirstResponder){
            usernameField.resignFirstResponder()
        }
        else if(passwordField.isFirstResponder){
            passwordField.resignFirstResponder()
        }
    }
    
    //when user want to edit the textfield, we should implement the delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //print("begin editing")
        if(usernameField.isFirstResponder){
            //print("\(usernameField.text)")
            if(usernameField.text=="enter username here"){
                usernameField.textColor = UIColor.black
                usernameField.text = string
                return false
            }
        }
        if(passwordField.isFirstResponder){
            //print("\(passwordField.text)")
            if(passwordField.text=="enter password here"){
                passwordField.textColor = UIColor.black
                passwordField.text=string
                return false
            }
        }
        return true
    }
    
    //deal with segue
    //don't allow segue here, we will do the username and password check later
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
 
}

