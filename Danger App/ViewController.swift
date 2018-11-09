//
//  ViewController.swift
//  Danger App
//
//  Created by Kenneth Uyabeme on 11/9/18.
//  Copyright © 2018 Kenneth Uyabeme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1a. define the url
        
        let abc = URL(string: chanllenges[dangerCellClickIndex].video! )
        let req = URLRequest(url: abc!)
        
        // 1b. tell the webview to load the url
        webview.loadRequest(req)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

