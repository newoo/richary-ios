//
//  DateFommaterExtension.swift
//  richary
//
//  Created by law on 2021/02/01.
//

import Foundation

extension DateFormatter {
    func dateFommat(_ format: String = "yyyy-MM-dd") -> Self {
        dateFormat = format
        return self
    }
}
