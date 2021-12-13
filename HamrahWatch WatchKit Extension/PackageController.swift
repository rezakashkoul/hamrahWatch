//
//  PackageController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 21/Azar/1400 .
//

import WatchKit
import Foundation

class PackageController: WKInterfaceController {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var packageKinds = ["اینترنت" , "مکالمه" , "پیامک" ]
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        DispatchQueue.main.async {
            self.setupTable()
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func setupTable() {
        if tableView == nil { return }
        
        tableView.setNumberOfRows(packageKinds.count, withRowType: "packageCell")
        for (index, item) in packageKinds.enumerated() {
            let row = tableView.rowController(at: index) as! PackageCustomCell
            row.titleOfPackage.setText( "بسته‌ی " + item)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if rowIndex == 0 {
            pushController(withName: "InternetPackageController", context: (index: rowIndex, data: packageKinds[rowIndex]))
        }
    }
}
