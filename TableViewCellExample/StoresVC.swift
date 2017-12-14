import UIKit

class StoresVC: UIViewController {
    
    //MARK: - Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    init() {
        super.init(nibName: nil, bundle:nil)
    }
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private let stores: [Store] = [//mock data
        Store(name: "Walmart", address: "123 Main St"),
        Store(name: "CVS", address: "25 Cherry Road"),
        Store(name: "Fuddruckers", address: "2504 Wendover"),
        Store(name: "Target", address: "55 Jim Clark St")
    ]
}

//MARK: - UITableViewDataSource
extension StoresVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let store = stores[indexPath.row]
        return StoreTVCell.makeCell(withStore: store, tableView: tableView, indexPath: indexPath)
    }
}

//MARK: - UITableViewDelegate
extension StoresVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StoreTVCell.rowHeight
    }
}
