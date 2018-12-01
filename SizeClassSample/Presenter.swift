//
//  Presenter.swift
//  SizeClassSample
//
//  Created by Takehito Koshimizu on 2018/12/01.
//

import UIKit

public class Presenter {

    private var reloadVisibleRows: () -> Void

    /// 画面の矩形と TraitCollection のペア
    private var state: (CGRect?, UITraitCollection?) = (nil, nil) {
        didSet {
            if oldValue != state {
                reloadVisibleRows()
            }
        }
    }

    public init(reloadVisibleRows: @escaping () -> Void) {
        self.reloadVisibleRows = reloadVisibleRows
    }

    public private(set) lazy var texts: [(CGRect, UITraitCollection) -> String] = [
        horizontalText,
        verticalText,
        widthText,
        ratioText,
    ]

    /// ビューコントローラから、画面の矩形と TraitCollection の変更を受け取る
    public func onUpdate(_ frame: CGRect?, _ traitCollection: UITraitCollection?) {
        self.state = (frame, traitCollection)
    }

    /// タイトル
    public var title: String? {
        /// アプリ名
        return Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String
    }

    /// 背景色
    public func backgroundColor(_ traitCollection: UITraitCollection) -> UIColor {
        /// SizeClass 毎に色を出し分ける
        let horizontal = traitCollection.horizontalSizeClass.description
        let vertical = traitCollection.verticalSizeClass.description
        let name = "Color-(h:\(horizontal), v:\(vertical))"
        return UIColor(named: name)!
    }

    /// 幅
    var widthText: (CGRect, UITraitCollection) -> String {
        return { (frame, _) in
            let width = NumberFormatter.decimalFormatter.string(from: frame.width as NSNumber)!
            return "width: \(width)"
        }
    }

    /// 表示比率
    var ratioText: (CGRect, UITraitCollection) -> String {
        return { (frame, _) in
            let screen = UIScreen.main.bounds.width
            let width = frame.width
            let ratio = width/screen
            let formatted = NumberFormatter.percentFormatter.string(from: ratio as NSNumber)!
            return "ratio: \(formatted)"
        }
    }

    /// 水平 Size Class
    var horizontalText: (CGRect, UITraitCollection) -> String {
        return { (_, traitCollection) in
            let horizontalSizeClass = traitCollection.horizontalSizeClass.description
            return "horizontal: \(horizontalSizeClass)"
        }
    }

    /// 垂直 Size Class
    var verticalText: (CGRect, UITraitCollection) -> String {
        return { (_, traitCollection) in
            let verticalSizeClass = traitCollection.verticalSizeClass.description
            return "vertical: \(verticalSizeClass)"
        }
    }
}
