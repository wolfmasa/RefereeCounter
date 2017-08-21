//
//  CounterInterfaceController.swift
//  RefereeCounter
//
//  Created by JobaraMasashi on 2017/08/21.
//  Copyright © 2017年 ProjectJ. All rights reserved.
//

import WatchKit
import Foundation


class CounterInterfaceController: WKInterfaceController {

    @IBOutlet var counter: WKInterfaceTimer!

    @IBOutlet var testLabel: WKInterfaceLabel!

    
    func update(tm: Timer) -> Void{
        print("update")
        testLabel.setText("finish !!!")
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let date = Date().addingTimeInterval(10)
        //counter.setDate(date)
        counter.start()

        let timer = Timer.scheduledTimer(withTimeInterval: date.timeIntervalSinceNow, repeats: false,
                                         block: self.update)

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
