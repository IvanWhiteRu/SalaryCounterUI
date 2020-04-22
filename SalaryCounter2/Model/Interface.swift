//
//  Interface.swift
//  SalaryCounter2
//
//  Created by Ivan Belyakov on 21.04.2020.
//  Copyright © 2020 Ivan Belyakov. All rights reserved.
//

import UIKit
extension Date {
    func localDate() -> Date {
        let nowGMT = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowGMT))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowGMT) else {return Date()}
        return localDate
    }
}
  protocol TimerCountable {
  var  dateOfSalary: Date {get}
  var dayOfSalary: Int { get set }
  var salaryAmount: Double {get}
  var salaryPerSecond: Double {get}
  var differenceInSecondsSincePayToNow: Int {get}
  var differnceInSecondsSincePayToNextPay: Int {get}
  var moneyGatheredSinceLastPay: Double {get}
  mutating func setDayOfSalary(_ textData: String?) -> Bool
  mutating func setSalaryAmount(_ textData: String?) -> Bool

}
