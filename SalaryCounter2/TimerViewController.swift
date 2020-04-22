//
//  ViewController.swift
//  SalaryCounter2
//
//  Created by Ivan Belyakov on 16.04.2020.
//  Copyright © 2020 Ivan Belyakov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var toSpendButton: UIButton!
    @IBOutlet weak var gatheredSinceNowLabel: UILabel!
    @IBOutlet weak var gatheredSinceLastPayLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    
    var container: SalaryTimer?
    var moneyGatheredSinceNow: Double = 0
    
    @objc func counter() {
      
       let textForGSLPL = container!.moneyGatheredSinceLastPay + moneyGatheredSinceNow
      gatheredSinceLastPayLabel.text = String(format: "%.0f", textForGSLPL)
      gatheredSinceNowLabel.text = String(format: "%.2f", self.moneyGatheredSinceNow)
            moneyGatheredSinceNow += container?.salaryPerSecond ?? 0.0
      
    }
  
   
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toSpendButton.layer.cornerRadius = 33
        toSpendButton.layer.borderWidth = 3
        toSpendButton.layer.borderColor = #colorLiteral(red: 0.8762342334, green: 0.8978926539, blue: 0.8111079335, alpha: 1)
        
        
        dayLabel.text = dayDate()
       monthLabel.text = monthDate()
        
        super.viewDidLoad()
     //
        if container != nil {
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        }
        
    }

    @IBAction func timerEditAction(_ sender: UIButton) {
    }
    
}

