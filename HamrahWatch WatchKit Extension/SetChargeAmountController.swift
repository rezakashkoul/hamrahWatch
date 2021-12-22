//
//  SetChargeAmountController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 22/Azar/1400 .
//

import UIKit
import WatchKit

class SetChargeAmountController: WKInterfaceController {
    
    @IBOutlet weak var topSeperator: WKInterfaceSeparator!
    @IBOutlet weak var normalChargeCustomAmountStackGroup: WKInterfaceGroup!
    @IBOutlet weak var chargeAmountLabel: WKInterfaceLabel!
    
    @IBOutlet weak var customAmountLabel: WKInterfaceLabel!
    
    @IBAction func increaseCustomAmount() {
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
    
    @IBAction func buyFromWallet() {
        if chargeAmount == 0 {
            showError()
        } else {
            showAlert()
            print("Bought \(chargeAmount) amount of charge from wallet!")
        }
    }
    
    var chargeType : String = ""
    var chargeIndex : Int = 0
    var chargeAmount : Int = 0
    
    override func awake(withContext context: Any?) {
        getAndShowData(context)
    }
    
    override func willActivate() {
        super.willActivate()
        self.scroll(to: self.topSeperator, at: .top , animated: true)
//        if chargeAmount != 0 {
//            chargeAmountLabel.setHidden(false)
//        } else {
//            chargeAmountLabel.setHidden(true)
//        }
    }
    
    func getAndShowData(_ context: Any?) {
        if let context = context as? (Int, String) {
            chargeIndex = context.0
            chargeType = context.1
            setTitle(chargeType)
            if chargeType == "عادی" {
                normalChargeCustomAmountStackGroup.setHidden(false)
                chargeAmountLabel.setHidden(true)
//                chargeAmountLabel.setText("لطفاً یکی از مقادیر موجود را انتخاب کنید و یا")
                if chargeAmount == 0 {
                    customAmountLabel.setText("لطفاً از مقادیر موجود یکی را انتخاب کنید و یا شارژ دلخواه را وارد کنید")
                } else {
                customAmountLabel.setText(chargeAmount.description.convertEngNumToPersianNum() + " ریال ")
                }
            } else {
                normalChargeCustomAmountStackGroup.setHidden(true)
                chargeAmountLabel.setHidden(false)
                if chargeAmount == 0 {
                    chargeAmountLabel.setText("لطفاً از مقادیر موجود یکی را انتخاب کنید")
                } else {
                    chargeAmountLabel.setText("شارژ" + chargeAmount.description.convertEngNumToPersianNum() + " ریال ")
                }
            }
        }
    }
    
    func setChargeAmount() {
        customAmountLabel.setText(chargeAmount.description.convertEngNumToPersianNum() + " ریال ")
        chargeAmountLabel.setText(chargeAmount.description.convertEngNumToPersianNum() + " ریال ")
        print("مبلغ شارژ : " , chargeAmount)
    }
    
    func showError() {
        let ok = WKAlertAction(title: "تأیید", style: WKAlertActionStyle.default) {
            print("تأیید")
        }
        presentAlert(withTitle: "مبلغ شارژ خالی است!", message: "لطفاً از مقادیر موجود یکی را انتخاب و یا یک مقدار دلخواه جهت شارژ حساب خود تعیین کنید.", preferredStyle: WKAlertControllerStyle.alert, actions:[ok])
    }
    
    func showAlert() {
        let ok = WKAlertAction(title: "تأیید", style: WKAlertActionStyle.default) {
            print("تأیید")
        }
        let cancel = WKAlertAction(title: "لغو", style: WKAlertActionStyle.cancel) {
            print("لغو")
        }
        presentAlert(withTitle: "خرید شارژ از کیف پول", message: "در صورتی که از مبلغ مورد نظر اطمینان دارید، لطفاً دکمه‌ی تأیید را بزنید.", preferredStyle: WKAlertControllerStyle.alert, actions:[ok , cancel])
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
