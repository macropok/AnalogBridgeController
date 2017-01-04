//
//  AnalogBridgeRunner.swift
//  AnalogBridgeController
//
//  Created by PSIHPOK on 1/3/17.
//  Copyright © 2017 marco. All rights reserved.
//

import UIKit

public class AnalogBridgeRunner: NSObject {
    public static let sharedRunner:AnalogBridgeRunner = AnalogBridgeRunner()
    private var mWindow:UIWindow!
    private var exitController:UIViewController!
    
    private var menuController:UIViewController!
    
    public func setInfo(publicKey:String, customerToken: String) {
        APIService.sharedService.setDefaultPublicKey(key: publicKey)
        APIService.sharedService.customerToken = customerToken
    }
    
    public func runFrom(controller:UIViewController) {
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(url:bundleURL!))
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "formatController")
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "menuController") as! MenuController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.closeLeft()
        
        menuController = slideMenuController
        
        controller.present(slideMenuController, animated: false, completion: nil)
    }
    
    public func exitAnalogBridge() {
        menuController.dismiss(animated: false, completion: nil)
    }
    
    public func run(window:UIWindow) {
        mWindow = window
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(url:bundleURL!))
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "formatController")
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "menuController") as! MenuController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.closeLeft()
        
        mWindow.rootViewController = slideMenuController
        mWindow.makeKeyAndVisible()
    }
    
    func registerExitController(controller:UIViewController) {
        exitController = controller
    }
    
    public func exit() {
        mWindow.rootViewController = exitController
        mWindow.makeKeyAndVisible()
    }
}
