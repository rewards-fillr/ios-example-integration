### Overview

This example project demonstrates a minimal integration with the Fillr Embedded SDK on iOS, highlighting the configuration and coding changes necessary for a successful integration with a new or preexisting iOS application.  

The code and this project (and highlighted below) can be used as a roadmap when performing your own Fillr integration.


### Prerequisites

Before getting started, please ensure you have the following:

1.  A Fillr API/Secret key pair.  [Contact us](mailto:ct@fillr.com) to get an API/Secrey key pair.
2.  A copy of latest Fillr iOS SDK or Our private Cocoapod credentials


### Running the Example Project

1.  Download the iOS SDK and copy the SDK files into the ios project `fillr-embedded-sdk-headless-only` folder.
Alternatiely dupliate existing target, remove the dependency on FillrSDK, and install Fillr iOS with Cocoapod private repo:
[Install SDK with Cocoapod](http://fillr.github.io/docs/sdk/browser/v6/ios/install_sdk_with_cocoapod)

2. Open the iOS project in XCode.
    
3.  Replace Fillr Dev Key and Secret Key in `AppDelegate.swift` (For iOS sample project) or FillrHeadlessModule.m (For react native sample project).

4. You should be able to run the project, the webview will load page http://www.fillr.com/test, and it should fill the form with sample profile.


### Further Resources

If you require additional help getting your Fillr integration up and running, please see the [in-depth integration guide](http://fillr.github.io/docs/sdk/browser/v6/ios/headless).
