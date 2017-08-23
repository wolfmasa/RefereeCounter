//
//  KickoffInterfaceController.swift
//  RefereeCounter
//
//  Created by JobaraMasashi on 2017/08/21.
//  Copyright © 2017年 ProjectJ. All rights reserved.
//

import WatchKit
import Foundation


class KickoffInterfaceController: WKInterfaceController {

    @IBOutlet var timerCount: WKInterfaceLabel!
    
    // デフォルトは15とする
    var timeCount = 15
    
    @IBAction func changeTimerCount(_ value: Float) {
        timeCount = Int(value)
        timerCount.setText("\(timeCount) min")
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
            return timeCount
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
