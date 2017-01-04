//
//  LoadingController.swift
//  AnalogBridgeController
//
//  Created by PSIHPOK on 1/4/17.
//  Copyright © 2017 marco. All rights reserved.
//

import UIKit

public class LoadingController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadAnalogBridge(_ sender: Any) {
        AnalogBridgeRunner.sharedRunner.run()
    }
}
