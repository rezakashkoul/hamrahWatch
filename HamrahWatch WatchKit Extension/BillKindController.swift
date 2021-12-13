//
//  ChoosingBillKindController.swift
//  HamrahWatch WatchKit Extension
//
//  Created by Reza Kashkoul on 22/Azar/1400 .
//

import WatchKit
import Foundation

class BillKindController: WKInterfaceController {
    
    
    @IBOutlet weak var midTermStackView: WKInterfaceGroup!
    @IBOutlet weak var longTermStackView: WKInterfaceGroup!
    @IBOutlet weak var buttonsStackView: WKInterfaceGroup!
    
    
    
    
    
    
    
    
    
    
    @IBAction func midTermBill() {
        status = .midTerm
        configueViewBasedOnBillKind()
    }
    
    @IBAction func longTermBill() {
        status = .longTerm
        configueViewBasedOnBillKind()
    }
    
    var status: BillKind = .midTerm
    enum BillKind {
        case midTerm
        case longTerm
    }
    

    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func configueViewBasedOnBillKind() {
        buttonsStackView.setHidden(true)
        switch status {
        case .midTerm:
            midTermStackView.setHidden(false)
            longTermStackView.setHidden(true)
            setTitle("میان‌دوره")
            print("midterm bill")
        case .longTerm:
            midTermStackView.setHidden(true)
            longTermStackView.setHidden(false)
            setTitle("پایان‌دوره")
            print("longTerm bill")
        }
    }
    
}
