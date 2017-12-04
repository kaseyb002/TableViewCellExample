import UIKit

class StoresVC: UIViewController {
    
    //MARK: - Required inits for Xibs
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) missing")}
    override var nibName: String? { return String(describing: type(of: self)) }
    init() {
        super.init(nibName: nil, bundle:nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StoreTVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "StoreTVCell")
    }
    
    private let stores: [Store] = [
        Store(name: "Walmart", address: "123 Main St"),
        Store(name: "CVS", address: "25 Cherry Road"),
        Store(name: "Fuddruckers", address: "2504 Wendover"),
        Store(name: "Target", address: "55 Jim Clark St")
    ]
}

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

extension StoresVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StoreTVCell.rowHeight
    }
}
