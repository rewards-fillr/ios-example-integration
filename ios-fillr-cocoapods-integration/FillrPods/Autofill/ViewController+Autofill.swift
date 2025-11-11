//
//  ViewController.swift
//  FillrPods
//
//  Created by Patel, Diptesh | AMB on 23/8/21.
//
import UIKit
import WebKit
import FillrAutofillSDK

let headLessBaseFillProvider = HeadlessBaseFillProvider()

class FillrProduct {

    static func inititalize(_ view:ViewController) {
        FillrAutofill.sharedInstance.enabled = true
        FillrAutofill.sharedInstance.profilePayloadDelegate = view
        FillrAutofill.sharedInstance.fillProvider = headLessBaseFillProvider
    }
}

extension ViewController: FillrProfilePayloadDelegate {

    func onProfilePayloadRequestedForWebView(_ webView: UIView, mappingResult: [String : Any], requestedFields: [Any], selectedFields: [String : Any]) {

        print("Fields detected \(requestedFields.debugDescription)")
        
        let samplePayload = [
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
        FillrAutofill.sharedInstance.fillForm(with: mappingResult, andPayload: samplePayload, withFieldSelections: selectedFields)
    }
}
