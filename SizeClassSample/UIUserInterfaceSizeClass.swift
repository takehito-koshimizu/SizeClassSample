//
//  UIUserInterfaceSizeClass.swift
//  SizeClassSample
//
//  Created by Takehito Koshimizu on 2018/12/01.
//

import UIKit

extension UIUserInterfaceSizeClass: CustomStringConvertible {

    private enum SwiftEnum : Int {
        case unspecified
        case compact
        case regular
    }

    public var description: String {
        return "\(SwiftEnum(rawValue: rawValue)!)"
    }
}
