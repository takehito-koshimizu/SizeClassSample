//
//  ViewController.swift
//  SizeClassSample
//
//  Created by Takehito Koshimizu on 2018/12/01.
//

import UIKit

final class ViewController: UITableViewController {

    private lazy var presenter = Presenter(reloadVisibleRows: reloadVisibleRows)

    private var reloadVisibleRows: () -> Void {
        return { [weak tableView = tableView] in
            if let rows = tableView?.indexPathsForVisibleRows {
                tableView?.reloadRows(at: rows, with: .automatic)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.title
        tableView.backgroundView = UIView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presenter.onUpdate(view.frame, traitCollection)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.texts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter.texts[indexPath.row](view.bounds, traitCollection)
        return cell
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        tableView.backgroundView?.backgroundColor = presenter.backgroundColor(traitCollection)
    }
}
