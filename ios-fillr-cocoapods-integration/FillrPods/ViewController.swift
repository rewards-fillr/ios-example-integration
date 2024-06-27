//
//  ViewController.swift
//  FillrPods
//
//  Created by Patel, Diptesh | AMB on 23/8/21.
//
import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FillrProduct.inititalize(self)
        Fillr.sharedInstance().trackWebview(webView)

        guard let url = URL(string: "https://macys.com") else {
            return
        }

        if #available(iOS 16.4, *) {
            webView.isInspectable = true
        }
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self

    }
}

extension ViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if Fillr.sharedInstance().canHandleWebViewRequest(navigationAction.request) {
            Fillr.sharedInstance().handleWebViewRequest(navigationAction.request, forWebView: webView)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Fillr.sharedInstance().trackWebview(webView)
        Fillr.sharedInstance()?.handleWebViewDidStartLoad(webView)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Fillr.sharedInstance()?.handleWebViewDidStartLoad(webView)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Fillr.sharedInstance()?.handleWebViewDidFinishLoad(webView)
    }
}
