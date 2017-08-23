//
//  RecordInterfaceController.swift
//  RefereeCounter
//
//  Created by JobaraMasashi on 2017/08/23.
//  Copyright © 2017年 ProjectJ. All rights reserved.
//

import WatchKit
import Foundation


class RecordInterfaceController: WKInterfaceController {
    
    var memoList: [String] = []
    var memoListDate: [Date] = []
    
    @IBOutlet var memoTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let args = context as! [Any]
        
        memoList = args[0] as! [String]
        memoListDate = args[1] as! [Date]
        
        memoTable.setNumberOfRows(10, withRowType: "MemoRow")
        for index in 0..<10 {
            let row = memoTable.rowController(at: index) as! MemoRow
            // TestRow クラスで作ったラベルに配列の文字列を入れる
            row.memoLabel.setText("\(index)")
        }
 
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
