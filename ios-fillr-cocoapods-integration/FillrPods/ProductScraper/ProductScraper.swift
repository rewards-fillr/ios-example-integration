//
//  ViewController.swift
//  FillrPods
//
//  Created by Patel, Diptesh | AMB on 23/8/21.
//
import UIKit
import WebKit

class FillrProduct {

    static func inititalize(_ view:ViewController) {
        FillrProductPageScraper.sharedInstance().setProductPageInformationExtractionEnabled(true)
        FillrProductPageScraper.sharedInstance().setProductPageInformationExtractionDelegate(view)
    }
}

extension ViewController : FillrProductPageInformationExtractionDelegate {
    
    func onProductPageDetected(_ webView: UIView!, productPageInformation: FillrProductPageInformation!) {
        let alert = UIAlertController(title: "Product Detected", message: productPageInformation.json, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

