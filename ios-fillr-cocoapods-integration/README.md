### Overview

This example project demonstrates a minimal integration with the Fillr SDK on iOS, highlighting the configuration and coding changes necessary for a successful integration with a new or preexisting iOS application.  

The code and this project (and highlighted below) can be used as a roadmap when performing your own Fillr integration.


### Prerequisites

Before getting started, please ensure you have the following:

1.  A Fillr API/Secret key pair.  [Contact us](mailto:product@fillr.com) to get an API/Secrey key pair.
2.  A copy of latest Fillr iOS SDK or Our private Cocoapod credentials


### Setup Jfrog Cocoapod repository for Fillr SDK

Fillr SDK is hosted on Jfrog Artifactory as private repository. In order to use CocoaPods with Artifactory, you need the cocoapods-art plugin.

1. Install the cocoapods-art plugin on your local machine from terminal: `gem install cocoapods-art`

2. The cocoapods-art plugin uses .netrc file for repository authentication. Add your Fillr iOS SDK repository username and password to your local ~/.netrc file as follow:

```
machine fillr.jfrog.io
login username
password password
```
    
3. Add an Fillr repository to your local cocoapod from terminal:
```
pod repo-art add fillr-ios-core-sdk https://fillr.jfrog.io/fillr/api/pods/fillr-ios-core-sdk
pod repo-art add fillr-ios-autofill-sdk https://fillr.jfrog.io/fillr/api/pods/fillr-ios-autofill-sdk
pod repo-art add fillr-ios-cartscraper-sdk https://fillr.jfrog.io/fillr/api/pods/fillr-ios-cartscraper-sdk
```
4. Update fillr repository 
```
pod repo-art update fillr-ios-core-sdk
pod repo-art update fillr-ios-autofill-sdk
pod repo-art update fillr-ios-cartscraper-sdk
```
4. Update your project Podfile, add the following, replace the target and version number:

```
plugin 'cocoapods-art', :sources => [
  'fillr-ios-core-sdk',
  'fillr-ios-autofill-sdk',
  'fillr-ios-cartscraper-sdk']
```
You can integrate the static or dynamic library
```
target "your-target" do
  pod 'fillr-autofill-static-xcframeworks', '~> sdk.version.number'
  pod 'fillr-cartscraper-static-xcframeworks', '~> sdk.version.number'
end
```
```
target "your-target" do
  pod 'fillr-autofill-dynamic-xcframeworks', '~> sdk.version.number'
  pod 'fillr-cartscraper-dynamic-xcframeworks', '~> sdk.version.number'
end
```

5. Run `pod install` to install Fillr SDK, you should be able to see Fillr SDK header files and static library file under `Pods` folder. Now you can continue with your integration
    
4. You should be able to run the project, the webview will load page https://getbootstrap.com/docs/4.5/examples/checkout, and it should fill the form with sample profile.


### Further Resources

If you require additional help getting your Fillr integration up and running, please see the following

[Autofill](http://fillr.github.io/docs/sdk/ios/v1/FillrAutofill)
[CartScraper](http://fillr.github.io/docs/sdk/ios/v1/FillrCartScraper)
