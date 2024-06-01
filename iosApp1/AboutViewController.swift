//
//  AboutViewController.swift
//  GuessNumber
//
//  Created by HamidReza Zebardast Barzin on 2024-05-30.
//

import WebKit
import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var webView: WKWebView! // outlet for Webkit View
    @IBAction func close() { // outlet for close button
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
      super.viewDidLoad()

      if let url = Bundle.main.url(
        forResource: "About", withExtension: "html") {
        let request = URLRequest(url: url)
        webView.load(request)
      }
    }

}
