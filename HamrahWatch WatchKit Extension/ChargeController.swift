//
//  ChargeController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 22/Azar/1400 .
//

import UIKit
import WatchKit

class ChargeController: WKInterfaceController {
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var chargeKinds = ["عادی" , "فوق‌العاده" ,"جوانان" , "بانوان" ]
    
    override func awake(withContext context: Any?) {
        setupTable()
    }
    
    func setupTable() {
        if tableView == nil { return }
        tableView.setNumberOfRows(chargeKinds.count, withRowType: "cell")
        for (index, item) in chargeKinds.enumerated() {
            let row = tableView.rowController(at: index) as! ChargeCustomCell
            row.chargeKindTitle.setText( "شارژ " + item)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "SetChargeAmountController", context: (index: rowIndex, data: chargeKinds[rowIndex]))
    }
    
    
}

