import UIKit

class StoreTVCell: UITableViewCell, TableViewCell {
    
    //MARK: - TableViewCell protocol implementation
    static var nibName: String { return String(describing: self) }
    static var reuseId: String { return String(describing: self) }
    static let rowHeight: CGFloat = 100
    
    static func makeCell(withStore store: Store,
                         tableView: UITableView,
                         indexPath: IndexPath) -> StoreTVCell {
        let cell = make(tableViewCell: self,
                        tableView: tableView,
                        indexPath: indexPath)
        cell.updateCell(withStore: store)
        return cell
    }

    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}

//MARK: - UI Updates
extension StoreTVCell {
    
    private func updateCell(withStore store: Store) {
        nameLabel.text = store.name
        addressLabel.text = store.address
    }
}
