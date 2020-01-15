//
//  WebViewController.swift
//  assignment
//
//  Created by Saurabh Mirajkar on 15/01/20.
//  Copyright © 2020 Saurabh Mirajkar. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = UserDefaults.standard.value(forKey: "token") ?? "QpwL5tke4Pnpja7X4"
        myWebView.load(URLRequest(url: URL(string:"https://mckinleyrice.com?token=\(token)")!))
    }

}
