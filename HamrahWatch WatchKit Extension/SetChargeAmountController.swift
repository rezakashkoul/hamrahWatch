//
//  SetChargeAmountController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 22/Azar/1400 .
//

import UIKit
import WatchKit

class SetChargeAmountController: WKInterfaceController {
    
    
    @IBOutlet weak var customAmount: WKInterfaceLabel!
    
    @IBAction func increaseCustomAmount() {
        //        chargeAmount = 0
        chargeAmount += 10_000
        setChargeAmount()
    }
    @IBAction func decreaseCustomAmount() {
        if chargeAmount >= 10_000 {
            chargeAmount -= 10_000
        }
        setChargeAmount()
    }
    
    @IBAction func hezarTomanButton() {
        chargeAmount = 10_000
        setChargeAmount()
    }
    @IBAction func doHezarTomanButton() {
        chargeAmount = 20_000
        setChargeAmount()
    }
    @IBAction func PanjHezarTomanButton() {
        chargeAmount = 50_000
        setChargeAmount()
    }
    @IBAction func dahHezarTomanButton() {
        chargeAmount = 100_000
        setChargeAmount()
    }
    @IBAction func bistHezarTomanButton() {
        chargeAmount = 200_000
        setChargeAmount()
    }
    
    
    
    
    
    
    
    
    var packageData : String = ""
    var packageIndex : Int = 0
    var isWallet = true
    var chargeAmount : Int = 0
    //    var customChargeAmount : Int = 0
    
    
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
    
    func setChargeAmount() {
        customAmount.setText("مبلغ شارژ : " + chargeAmount.description.convertEngNumToPersianNum())
        print("مبلغ شارژ : " , chargeAmount)
    }
}

extension String {
    func convertEngNumToPersianNum()->String{
        let format = NumberFormatter()
        format.locale = Locale(identifier: "fa_IR")
        let number =   format.number(from: self)
        
        let faNumber = format.string(from: number!)
        return faNumber!
        
    }
    func convertToPersian()-> String {
        let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
}
