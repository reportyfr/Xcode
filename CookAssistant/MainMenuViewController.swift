//
//  MainMenuViewController.swift
//  CookAssistant
//
//  Created by reportyfr on 4/26/17.
//  Copyright © 2017 Syracuse. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationvc = segue.destination
        if let detail = destinationvc as? MenuDetailViewController{
            if let identifer = segue.identifier{
                switch identifer {
                case "ChineseFood":
                    detail.itemNum = 1
                default:
                    break
                }
            }
        }
    }

}
