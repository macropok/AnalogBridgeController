#
#  Be sure to run `pod spec lint AnalogBridgeController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "AnalogBridgeController"
  s.version      = "0.2.6"
  s.summary      = "For Testing AnalogBridge"
  s.homepage     = "http://marco/AnalogBridgeController"
  s.license      = "BSD"
  s.author             = { "marco" => "marcorampok@outlook.com" }
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/macropok/AnalogBridgeController.git", :tag => "#{s.version}" }
  s.framework  = "Foundation", "UIKit", "QuartzCore"
  s.dependency "SDWebImage"
  s.dependency "JGProgressHUD"
  s.dependency "ActionSheetPicker-3.0"
  s.dependency "Stripe"

  s.source_files = "AnalogBridgeController/**/*.{swift}"
  s.resource_bundles = {
    'AnalogBridgeController' => [
      'AnalogBridgeController/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'
    ]
  }

end
