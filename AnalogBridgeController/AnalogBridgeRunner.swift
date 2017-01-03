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
    
    
    public func setDefaultPublicKey(key:String) {
        APIService.sharedService.setDefaultPublicKeyForPayment(key: key)
    }
    
    public func run(window:UIWindow) {
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(url:bundleURL!))
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "formatController")
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "menuController") as! MenuController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.closeLeft()
        
        window.rootViewController = slideMenuController
        window.makeKeyAndVisible()
    }
}
