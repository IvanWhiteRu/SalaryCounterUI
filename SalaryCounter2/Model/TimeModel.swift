//
//  TimeModel.swift
//  SalaryCounter2
//
//  Created by Ivan Belyakov on 17.04.2020.
//  Copyright © 2020 Ivan Belyakov. All rights reserved.
//

import Foundation

// Создаем текущую дату
let date = Date()
// Создаем  форматор дат
let dateFormatter = DateFormatter()


func dayDate() -> String {
    
    dateFormatter.dateFormat = "dd" // формат даты
    let dayString = dateFormatter.string(from: date)
    return dayString
    
}

func monthDate() -> String {
    
    dateFormatter.locale = Locale(identifier: "ru_RU")
    dateFormatter.dateFormat = "MMMM"
    return dateFormatter.string(from: date)
    
}
