//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp", in: Bundle(url: bundleURL!), compatibleWith: nil)!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        
        var orderButton:MJBadgeBarButton!
        let customBtn = UIButton(type: UIButtonType.custom)
        customBtn.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        customBtn.addTarget(self, action: #selector(self.toggleOrderHistory), for: .touchUpInside)
        customBtn.setImage(UIImage(named: "ic_person", in: Bundle(url: bundleURL!), compatibleWith: nil)!, for: .normal)
        orderButton = MJBadgeBarButton()
        orderButton.setup(customButton: customBtn)
        orderButton.badgeValue = "0"
        orderButton.badgeOriginX = 20.0
        orderButton.badgeOriginY = -4
        
        var shoppingCartButton:MJBadgeBarButton!
        let customButton = UIButton(type: UIButtonType.custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        customButton.addTarget(self, action: #selector(self.toggleShoppingCart), for: .touchUpInside)
        customButton.setImage(UIImage(named: "ic_shopping_cart", in: Bundle(url: bundleURL!), compatibleWith: nil)!, for: .normal)
        
        shoppingCartButton = MJBadgeBarButton()
        shoppingCartButton.setup(customButton: customButton)
        
        shoppingCartButton.badgeValue = "0"
        shoppingCartButton.badgeOriginX = 20.0
        shoppingCartButton.badgeOriginY = -4
        
        let exitButton:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_exit_to_app", in: Bundle(url: bundleURL!), compatibleWith: nil)!, style: .plain, target: self, action: #selector(self.toggleExitApp))
        
        self.navigationItem.rightBarButtonItems = [exitButton, shoppingCartButton, orderButton]
        for button in self.navigationItem.rightBarButtonItems! {
            (button).tintColor = UIColor.black
        }
        
        setBadge(count: APIService.sharedService.cartCount)
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    func setBadge(count:Int) {
        
        let orderButton:MJBadgeBarButton = self.navigationItem.rightBarButtonItems![2] as! MJBadgeBarButton
        if APIService.sharedService.customer != nil && APIService.sharedService.customer!["approvals"] != nil {
            let approvals = APIService.sharedService.customer!["approvals"].intValue
            orderButton.badgeValue = "\(approvals)"
        }
        
        let cartButton:MJBadgeBarButton = self.navigationItem.rightBarButtonItems![1] as! MJBadgeBarButton
        cartButton.badgeValue = "\(count)"
    }
    
    func toggleOrderHistory() {
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(url:bundleURL!))
        
        let orderHistoryController = storyboard.instantiateViewController(withIdentifier: "orderHistoryController")
        let navController = UINavigationController(rootViewController: orderHistoryController)
        self.slideMenuController()?.changeMainViewController(navController, close: true)
    }
    
    func toggleShoppingCart() {
        let podBundle = Bundle(for: self.classForCoder)
        let bundleURL = podBundle.url(forResource: "AnalogBridgeController", withExtension: "bundle", subdirectory: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(url:bundleURL!))
        let shoppingCartController = storyboard.instantiateViewController(withIdentifier: "shoppingCartController")
        let navController = UINavigationController(rootViewController: shoppingCartController)
        self.slideMenuController()?.changeMainViewController(navController, close: true)
    }
    
    func toggleExitApp() {
        AnalogBridgeRunner.sharedRunner.exitAnalogBridge()
    }
}
