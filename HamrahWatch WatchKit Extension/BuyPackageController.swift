//
//  BuyPackageController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 21/Azar/1400 .
//

import UIKit
import WatchKit

class BuyPackageController: WKInterfaceController {
    @IBOutlet weak var packageName: WKInterfaceLabel!
    @IBOutlet weak var packageDescription: WKInterfaceLabel!
    @IBOutlet weak var buyFromBalanceOrBill: WKInterfaceButton!
    @IBOutlet weak var buyFromWallet: WKInterfaceButton!
    
    @IBAction func buyFromWalletAction() {
        isWallet = true
        showAlert()
    }
    
    @IBAction func buyFromBalanceOrBillAction() {
        isWallet = false
        showAlert()
    }
    
    var packageData : String = ""
    var packageIndex : Int = 0
    var isWallet = true
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        getAndShowData(context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func getAndShowData(_ context: Any?) {
        if let context = context as? (Int, String) {
            packageIndex = context.0
            packageData = context.1
            packageName.setText("بسته‌ی شماره‌ی " + packageData)
            //            print("packageIndex is", packageIndex)
        }
    }
    
    func showAlert() {
        var alertTitle = ""
        if isWallet {
            alertTitle = "خرید از کیف پول"
        } else {
            alertTitle = "خرید از اعتبار (قبض)"
        }
        let ok = WKAlertAction(title: "تأیید", style: WKAlertActionStyle.default) {
            self.popToRootController()
            print("تأیید")
        }
        let cancel = WKAlertAction(title: "لغو", style: WKAlertActionStyle.cancel) {
            print("لغو")
        }
        presentAlert(withTitle: alertTitle, message: "در صورتی که از خرید خود اطمینان دارید، لطفاً دکمه‌ی تأیید را بزنید.", preferredStyle: WKAlertControllerStyle.alert, actions:[ok , cancel])
    }
    
}
