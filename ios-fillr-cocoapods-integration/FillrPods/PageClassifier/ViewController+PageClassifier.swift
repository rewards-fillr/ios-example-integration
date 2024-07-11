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
        FillrPageClassifier.sharedInstance().setPageClassifierDelegate(view)
    }
}

extension ViewController : FillrPageClassifierInformationExtractionDelegate {
    func pageClassificationChanged(at url: URL!, to pageType: FillrPageClassifications, withMetadata pageMeta: [AnyHashable : Any]!) {
        
        let displayedGuess:String = pageMeta["guessedPageType"] as! String;

        let alert = UIAlertController(title: "Page Classification", message: "\(displayedGuess)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
}

