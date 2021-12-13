//
//  InternetPackageController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 21/Azar/1400 .
//

import WatchKit
import Foundation


class InternetPackageController: WKInterfaceController {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var internetPackages = ["یک‌روزه" , "یک‌هفته‌ای" , "یک‌ماهه" , "سه‌ماهه"]
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
            self.setupTable()
    }
    
    func setupTable() {
        if tableView == nil { return }
        tableView.setNumberOfRows(internetPackages.count, withRowType: "internetPackageCell")
        for (index, item) in internetPackages.enumerated() {
            let row = tableView.rowController(at: index) as! InternetPackageCustomCell
            row.internetPackageTitle.setText( "بسته‌ی شماره‌ی " + item.description)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "BuyPackageController", context: (index: rowIndex, data: internetPackages[rowIndex]))
    }
}
