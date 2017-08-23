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

    var startDate: Date! = nil
    var timer: Timer! = nil
    
    var memoList: [String] = []
    var memoListDate: [Date] = []
    var scoreA = 0
    var scoreB = 0
    
    func update(tm: Timer) -> Void{
        print("update")
        testLabel.setText("finish !!!")
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var interval: Double = 15 * 60
        if let countTime = context as? Int{
            interval = Double(countTime * 60)
            testLabel.setText("\(countTime) min")
        } else{
            testLabel.setText("not found")
        }
        
        startDate = Date().addingTimeInterval(interval)
        
        counter.setDate(startDate)
        counter.start()

        timer = Timer.scheduledTimer(withTimeInterval: startDate.timeIntervalSinceNow, repeats: false,
                                         block: self.update)
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return [memoList, memoListDate]
    }
    
    @IBAction func inputText() {
        
        let suggestions: Array<String>! = ["チームAの得点", "チームBの得点","警告", "退場"]
        self.presentTextInputController(withSuggestions: suggestions, allowedInputMode: .plain, completion: {
            (objects: [Any]?) -> Void in
            // 入力されたテキスト内容を処理する
            print(objects)
            let text = objects?.first as! String
            self.memoList.append(text)
            self.memoListDate.append(Date())
            
            self.dismissTextInputController()
        })
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        counter.start()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        counter.stop()
        timer.invalidate()
    }

}
