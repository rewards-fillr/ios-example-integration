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
        FillrPageClassifier.sharedInstance().setPageClassifierEnabled(true)
        FillrOrderScraper.sharedInstance().setOrderConfirmationInformationExtractionEnabled(true)
        FillrOrderScraper.sharedInstance().setOrderConfirmationInformationExtractionDelegate(view)
    }
}

extension ViewController : FillrOrderConfirmationInformationExtractionDelegate {
    func orderConfirmed(at url: URL!, with orderInformation: FillrOrderInformation!) {
        let alert = UIAlertController(title: "Order Detected \(orderInformation.orderNumber ?? "")", message: orderInformation.json, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

