//
//  EditViewController.swift
//  SalaryCounter2
//
//  Created by Ivan Belyakov on 21.04.2020.
//  Copyright © 2020 Ivan Belyakov. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var salaryAmountTextField: UITextField!
    @IBOutlet weak var dayOfSalaryTextField: UITextField!
    var timer = SalaryTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

      @IBAction func toSpendButtonAction(_ sender: UIButton) {
         guard  timer.setSalaryAmount(salaryAmountTextField.text) else {
             let alert = UIAlertController(title: "Внимание!", message: "В поле суммы зарплаты должно быть числовое значение, можно дробное.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ладно", style: .default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             salaryAmountTextField.text = ""
             return
           }
           guard timer.setDayOfSalary(dayOfSalaryTextField.text) else {
             let alert = UIAlertController(title: "Внимание!", message: "В поле даты зарплаты должно быть значение от 1 до 28", preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "Ладно", style: .default, handler: nil))
                 self.present(alert, animated: true, completion: nil)
                 dayOfSalaryTextField.text = ""
             return
           }
           prepare(for: UIStoryboardSegue(identifier: "toTimerVC ", source: self, destination: TimerViewController()), sender: self)
     }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as? TimerViewController
       destinationVC?.container = self.timer
     }
     
    
}
