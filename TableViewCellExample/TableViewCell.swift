import UIKit

//protocol for reducing UITableViewCell boilerplate
protocol TableViewCell {
    static var nibName: String { get }
    static var reuseId: String { get }
    static var rowHeight: CGFloat { get }
}

func make<T: TableViewCell>(tableViewCell: T.Type,
                            tableView: UITableView,
                            indexPath: IndexPath) -> T {
    let nib = UINib(nibName: T.nibName, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: T.reuseId)
    let cell = tableView.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
    return cell
}
