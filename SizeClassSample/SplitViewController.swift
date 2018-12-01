//
//  SplitViewController.swift
//  SizeClassSample
//
//  Created by Takehito Koshimizu on 2018/12/02.
//

import UIKit

final class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredDisplayMode = .allVisible
        let detail = children.last?.children.last
        detail?.navigationItem.leftBarButtonItem = displayModeButtonItem
    }
}
