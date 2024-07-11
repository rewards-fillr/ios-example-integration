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
        
        FillrCartScraper.sharedInstance().setCartInformationExtractionEnabled(true)
        FillrCartScraper.sharedInstance().setCartInformationExtractionDelegate(view)
    }
}

extension ViewController : FillrCartInformationExtractionDelegate {
    
    func onCartDetected(_ webView: UIView!, cartInformation: FillrCartInformation!) {
        
        let alert = UIAlertController(title: "Cart Detected", message: cartInformation.json!, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

