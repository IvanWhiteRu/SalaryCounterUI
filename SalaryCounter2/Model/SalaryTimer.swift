//
//  SalaryTimer.swift
//  SalaryCounter2
//
//  Created by Ivan Belyakov on 21.04.2020.
//  Copyright © 2020 Ivan Belyakov. All rights reserved.
//

import UIKit
/// Объявляем структуру. Структура это удобно, структура это отличная оболочка.
struct SalaryTimer: TimerCountable {
  var moneyGatheredSinceLastPay: Double {
    return Double(differenceInSecondsSincePayToNow) * salaryPerSecond
  }
  mutating func setSalaryAmount(_ textData: String?) -> Bool {
    guard let text = textData else {return false}
    if let safeData = Double(text) {
      self.salaryAmount = safeData
      return true
    } else
    {return false}
  }
  ///Ну ты бро даееешь, колесики за 70 тысяч. Я чуть не поседел...
  
  /// Вычисляемая при обращении к ней переменная - разница в секундах между датой зарплаты  и следующей датой зарплаты. То бишь дата ЗП + месяц вперед и получаем разница в секундах.
  var differnceInSecondsSincePayToNextPay: Int {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .month, value: 1, to: dateOfSalary)!
    let differnce = calendar.dateComponents([.second], from: self.dateOfSalary, to: date)
    return differnce.second!
  }
/// Возвращает дату ЗП на основании Int  введенного в поле  "Дата зарплаты"
 var dateOfSalary: Date {
  let date = Date().localDate()
  var dateComponents = Calendar.current.dateComponents(in: .current, from: date)
  if dayOfSalary > dateComponents.day! {
    dateComponents.month! -= 1
    dateComponents.day = self.dayOfSalary
  }
  else {
    dateComponents.day = self.dayOfSalary
  }
    return Calendar.current.date(from: dateComponents) ?? Date()
  }
  /// Собстно дата зарплаты
  var dayOfSalary: Int = 1
  ///Собстно зряплата
  var salaryAmount: Double = 30000
  /// Вычисляется при обращении - зарплата в секунду
  var salaryPerSecond: Double {
    return self.salaryAmount/Double(differnceInSecondsSincePayToNextPay)
  }
  /// Вычисляется сколько секунд прошло с последней зряплаты
  var differenceInSecondsSincePayToNow: Int {
    let date = Date().localDate()
    if dateOfSalary > date {
      let calendar = Calendar.current
      let diffrence = calendar.dateComponents([.second], from: date, to: self.dateOfSalary)
      return diffrence.second!
    }
    else {
      let calendar = Calendar.current
      let diffrence = calendar.dateComponents([.second], from: self.dateOfSalary, to: date)
      return diffrence.second!
      
    }
  }
  /// Собственно провелярщик ввода из поля Дата зарплаты
  mutating func setDayOfSalary(_ textData: String?) -> Bool {
    guard let dayToSet = Int(textData!) else {
      return false
    }
    if dayToSet < 1 || dayToSet > 28 {
      return false
    }
    else {
      self.dayOfSalary = dayToSet
      return true
    }
    
  }
}
