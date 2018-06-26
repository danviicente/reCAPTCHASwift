//
//  ViewController.swift
//  reCAPTCHA
//
//  Created by Danton Vicente on 20/06/2018.
//  Copyright © 2018 Danton Vicente. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {

    var webView: WKWebView!
    @IBOutlet weak var viewWeb: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        let myURL = URL(string: "https://www.mocky.io/v2/5b2bd6a13000007700234818")!
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    override func loadView() {
      
        let contentController = WKUserContentController();
        contentController.add(
            self,
            name: "tokenResponse"
        )
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = contentController
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished navigating to url \(String(describing: webView.url))")
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "tokenResponse" {
            print("JavaScript is sending a message \(message.body)")
            let token = "\(message.body)"
        
            let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            myVC.stringPassed = token
            navigationController?.pushViewController(myVC, animated: true)
        }
        
    }

    // add constraints to your web view
    func setupWKWebViewConstraints() {
        
        let paddingConstant:CGFloat = 30.0
        let bottomConstant:CGFloat = 200.0
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: paddingConstant).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -bottomConstant).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: paddingConstant).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -paddingConstant).isActive = true
    }
}

