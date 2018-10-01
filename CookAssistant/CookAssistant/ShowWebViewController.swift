//
//  ShowWebViewController.swift
//  CookAssistant
//
//  Created by Junhua Chen on 2017/4/27.
//  Copyright © 2017年 Syracuse. All rights reserved.
//

import UIKit

class ShowWebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set the URL
        let url = URL(string: "https://www.bbcgoodfood.com/howto/guide/how-cook-perfect-steak");
        
        // establish request
        let request = URLRequest(url: url!);
        
        // load request
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
