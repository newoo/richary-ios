//
//  DateExtension.swift
//  richary
//
//  Created by newoo on 2021/02/01.
//

import Foundation

extension Date {
    func toString(by dateFormatter: DateFormatter = DateFormatter()) -> String {
        dateFormatter.dateFommat().string(from: self)
    }
}
