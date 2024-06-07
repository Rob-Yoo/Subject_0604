//
//  Date+Extension.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import Foundation

extension Date {
    func getYesterDayString() -> String {
        let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: self)!
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: yesterDay)
    }
}
