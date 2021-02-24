
import UIKit

class ViewController: UIViewController{
    
    var tableViewData = [cellData]()
    @IBOutlet var tableView: UITableView!
    let viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    /**
     This is class of method is responsible to register the NIB on table view
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    func setupTableView(){
        self.viewModel.tableView = self.tableView
        self.viewModel.getData()
        self.viewModel.registerNibs()
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    
}


//MARK:- UITableView datasource methods
extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.productData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.productData[section].opened == true {
            return self.viewModel.productData[section].subCategory?.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return self.viewModel.getHeaderCell(indexPath: indexPath)
        } else {
            return self.viewModel.getCategoryCell(indexPath: indexPath)
        }
    }
}
