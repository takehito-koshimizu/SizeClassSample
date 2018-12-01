//
//  NumberFormatter.swift
//  SizeClassSample
//
//  Created by Takehito Koshimizu on 2018/12/01.
//

import Foundation

extension NumberFormatter {

    static let decimalFormatter: NumberFormatter = {
        let formatter = baseFormatter()
        formatter.numberStyle = .decimal
        formatter.positiveFormat = "0.00"
        return formatter
    }()

    static let percentFormatter: NumberFormatter = {
        let formatter = baseFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()

    private static func baseFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .floor
        return formatter
    }
}
