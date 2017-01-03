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
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        
        
        let orderHistoryButton:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_person"), style: .plain, target: self, action: #selector(self.toggleOrderHistory))
        
        var shoppingCartButton:MJBadgeBarButton!
        let customButton = UIButton(type: UIButtonType.custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        customButton.addTarget(self, action: #selector(self.toggleShoppingCart), for: .touchUpInside)
        customButton.setImage(UIImage(named: "ic_remove_shopping_cart"), for: .normal)
        
        shoppingCartButton = MJBadgeBarButton()
        shoppingCartButton.setup(customButton: customButton)
        
        shoppingCartButton.badgeValue = "0"
        shoppingCartButton.badgeOriginX = 20.0
        shoppingCartButton.badgeOriginY = -4
        
        let exitButton:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_exit_to_app"), style: .plain, target: self, action: #selector(self.toggleExitApp))
        
        self.navigationItem.rightBarButtonItems = [exitButton, shoppingCartButton, orderHistoryButton]
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
        let badgeButton:MJBadgeBarButton = self.navigationItem.rightBarButtonItems![1] as! MJBadgeBarButton
        badgeButton.badgeValue = "\(count)"
    }
    
    func toggleOrderHistory() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let orderHistoryController = storyboard.instantiateViewController(withIdentifier: "orderHistoryController")
        let navController = UINavigationController(rootViewController: orderHistoryController)
        self.slideMenuController()?.changeMainViewController(navController, close: true)
    }
    
    func toggleShoppingCart() {
        print ("shopping toggle clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let shoppingCartController = storyboard.instantiateViewController(withIdentifier: "shoppingCartController")
        let navController = UINavigationController(rootViewController: shoppingCartController)
        self.slideMenuController()?.changeMainViewController(navController, close: true)
    }
    
    func toggleExitApp() {
        
    }
}
