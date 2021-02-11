//
//  ViewController.swift
//  ios-example-integration
//
//  Created by Alex Bin Zhao on 11/2/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, FillrProfilePayloadDelegate, FillrCartInformationExtractionDelegate {
    
    var holdCreditCardFilling = true
    var currentWebView: WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.fillr.com/test"
        let webView = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: self.view!.bounds.size.width, height: self.view!.bounds.size.height))
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        webView.load(URLRequest(url: NSURL(string: urlString)! as URL))
        self.view!.addSubview(webView)
        currentWebView = webView
        
        // Fill credit card button
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 135, y: 60, width: 120, height: 36)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = UIColor.lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Fill CreditCard", for: .normal)
        button.addTarget(self, action: #selector(fillCreditCard), for: .touchUpInside)
        self.view.addSubview(button)
        
        Fillr.sharedInstance().trackWebview(webView)
        Fillr.sharedInstance()?.profilePayloadDelegate = self
        
        Fillr.sharedInstance()?.setCartInformationExtractionEnabled(true)
        Fillr.sharedInstance()?.setCartInformationExtractionDelegate(self)
    }

    @objc func fillCreditCard() {
        if currentWebView != nil {
            holdCreditCardFilling = false;
            Fillr.sharedInstance()?.triggerFill(currentWebView!)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if Fillr.sharedInstance().canHandleWebViewRequest(navigationAction.request) {
            Fillr.sharedInstance().handleWebViewRequest(navigationAction.request, forWebView: webView)
            decisionHandler(.cancel)
            return
        }
        
        // Integrator code goes here afterwards
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Fillr.sharedInstance()?.handleWebViewDidStartLoad(webView)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Fillr.sharedInstance()?.handleWebViewDidFinishLoad(webView)
    }

    func onProfilePayloadRequested(forWebView webView: UIView!, mappingResult: [AnyHashable : Any]!, requestedFields: [Any]!, selectedFields: [AnyHashable : Any]!) {
        let samplePayloadWithoutCreditCards = [
            "PersonalDetails.Honorific": "Mr.",
            "PersonalDetails.FirstName": "John",
            "PersonalDetails.MiddleName": "Middle",
            "PersonalDetails.LastName": "South",
            "PersonalDetails.BirthDate.Year": "1999",
            "PersonalDetails.BirthDate.Month": "1",
            "PersonalDetails.BirthDate.Day": "11",
            "PersonalDetails.Gender" : "Male",
            
            "PersonalDetails.SocialSecurityNumber": "865414088",
            "PersonalDetails.TaxFileNumber": "865414088",
            "PersonalDetails.Role": "Director",
            "PersonalDetails.CompanyName": "Starks",
            
            "ContactDetails.Emails.Email.Address": "john.south@fillr.com",
            "ContactDetails.CellPhones.CellPhone.CountryCode": "61",
            "ContactDetails.CellPhones.CellPhone.Number": "0455667788",
            "ContactDetails.LandlinePhones.LandlinePhone.CountryCode": "1",
            "ContactDetails.LandlinePhones.LandlinePhone.AreaCode": "208",
            "ContactDetails.LandlinePhones.LandlinePhone.Number": "4561343",
            
            "AddressDetails.PostalAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.PostalAddress.StreetNumber": "27",
            "AddressDetails.PostalAddress.StreetName": "Oakmont",
            "AddressDetails.PostalAddress.StreetType": "Drive",
            "AddressDetails.PostalAddress.Suburb": "Brentwood",
            "AddressDetails.PostalAddress.AdministrativeArea": "California",
            "AddressDetails.PostalAddress.PostalCode": "94513",
            "AddressDetails.PostalAddress.Country": "United States",
            
            "AddressDetails.BillingAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.BillingAddress.StreetNumber": "27",
            "AddressDetails.BillingAddress.StreetName": "Oakmont",
            "AddressDetails.BillingAddress.StreetType": "Drive",
            "AddressDetails.BillingAddress.Suburb": "Brentwood",
            "AddressDetails.BillingAddress.AdministrativeArea": "California",
            "AddressDetails.BillingAddress.PostalCode": "94513",
            "AddressDetails.BillingAddress.Country": "United States",
        ]
        let samplePayloadWithCreditCards = [
            "PersonalDetails.Honorific": "Mr.",
            "PersonalDetails.FirstName": "John",
            "PersonalDetails.MiddleName": "Middle",
            "PersonalDetails.LastName": "South",
            "PersonalDetails.BirthDate.Year": "1999",
            "PersonalDetails.BirthDate.Month": "1",
            "PersonalDetails.BirthDate.Day": "11",
            "PersonalDetails.Gender" : "Male",
            
            "PersonalDetails.SocialSecurityNumber": "865414088",
            "PersonalDetails.TaxFileNumber": "865414088",
            "PersonalDetails.Role": "Director",
            "PersonalDetails.CompanyName": "Starks",
            
            "ContactDetails.Emails.Email.Address": "john.south@fillr.com",
            "ContactDetails.CellPhones.CellPhone.CountryCode": "61",
            "ContactDetails.CellPhones.CellPhone.Number": "0455667788",
            "ContactDetails.LandlinePhones.LandlinePhone.CountryCode": "1",
            "ContactDetails.LandlinePhones.LandlinePhone.AreaCode": "208",
            "ContactDetails.LandlinePhones.LandlinePhone.Number": "4561343",
            
            "AddressDetails.PostalAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.PostalAddress.StreetNumber": "27",
            "AddressDetails.PostalAddress.StreetName": "Oakmont",
            "AddressDetails.PostalAddress.StreetType": "Drive",
            "AddressDetails.PostalAddress.Suburb": "Brentwood",
            "AddressDetails.PostalAddress.AdministrativeArea": "California",
            "AddressDetails.PostalAddress.PostalCode": "94513",
            "AddressDetails.PostalAddress.Country": "United States",
            
            "AddressDetails.BillingAddress.AddressLine1": "27 Oakmont Drive",
            "AddressDetails.BillingAddress.StreetNumber": "27",
            "AddressDetails.BillingAddress.StreetName": "Oakmont",
            "AddressDetails.BillingAddress.StreetType": "Drive",
            "AddressDetails.BillingAddress.Suburb": "Brentwood",
            "AddressDetails.BillingAddress.AdministrativeArea": "California",
            "AddressDetails.BillingAddress.PostalCode": "94513",
            "AddressDetails.BillingAddress.Country": "United States",
            
            "CreditCards.CreditCard.Number":"6868686868686868",
            "CreditCards.CreditCard.Type": "Mastercard",
            "CreditCards.CreditCard.Expiry": "06-2018",
            "CreditCards.CreditCard.Expiry.Month": "06",
            "CreditCards.CreditCard.Expiry.Year": "2020",
            "CreditCards.CreditCard.NameOnCard": "John South",
            "CreditCards.CreditCard.CCV": "678"
        ]
        Fillr.sharedInstance()?.fillForm(withMappings: mappingResult, andPayload: holdCreditCardFilling ? samplePayloadWithoutCreditCards : samplePayloadWithCreditCards, withFieldSelections: selectedFields)
        holdCreditCardFilling = true
    }
    
    func onCartDetected(_ webView: UIView!, cartInformation: FillrCartInformation!) {
        print(cartInformation.total)
    }
}

