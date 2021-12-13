//
//  SetChargeAmountController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 22/Azar/1400 .
//

import UIKit
import WatchKit

class SetChargeAmountController: WKInterfaceController {

    
    var packageData : String = ""
    var packageIndex : Int = 0
    var isWallet = true
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        getAndShowData(context)
    }
    
    
    func getAndShowData(_ context: Any?) {
        if let context = context as? (Int, String) {
            packageIndex = context.0
            packageData = context.1
//            packageName.setText("بسته‌ی شماره‌ی " + packageData)
            //            print("packageIndex is", packageIndex)
        }
    }
    
}
