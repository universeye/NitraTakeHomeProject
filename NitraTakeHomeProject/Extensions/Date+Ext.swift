//
//  Date+Ext.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import Foundation

extension Date {
    func convertToYearMonthDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: self)
    }
    
    func formattedRelativeTime() -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        if calendar.isDateInToday(self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: self)
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else if let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date()), self > weekAgo {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: self)
        } else {
            dateFormatter.dateFormat = "yyyy/MM/dd"
            return dateFormatter.string(from: self)
        }
    }
}
