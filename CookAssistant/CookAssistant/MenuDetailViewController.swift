//
//  MenuDetailViewController.swift
//  CookAssistant
//
//  Created by reportyfr on 4/26/17.
//  Copyright © 2017 Syracuse. All rights reserved.
//

import UIKit

class MenuDetailViewController: UITableViewController {
    //accept the parameter from MainMenuViewController
    var itemNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UIAlertController
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        let alertController = UIAlertController(title: "\(itemNum)",
                                                message: "您确定要离开hangge.com吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }}
