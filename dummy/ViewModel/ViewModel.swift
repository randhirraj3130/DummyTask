
import Foundation
import UIKit


class ViewModel {
    var  productData = [ProductList]()
    var tableView:UITableView?
    
    /**
     This is class of method is responsible to get the JSON data from JSON file
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    func getData(){
        if let path = Bundle.main.path(forResource: "menu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                //if let encoded = try? encoder.encode(swift) {
                if let json = String(data: data, encoding: .utf8) {
                    print(json)
                }
                
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([ProductList].self, from: data) {
                    self.productData = decoded
                    
                }
                
            } catch {
                // handle error
            }
        }
    }
    /**
     This is class of method is responsible to register the table view cell
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    func registerNibs() {
        tableView?.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView?.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
    }
    
    /**
     This is class of method is responsible to get the table view cell for header
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    func getHeaderCell(indexPath:IndexPath)->UITableViewCell{
        //let dataIndex = indexPath.row - 1
        let cell = tableView?.dequeueReusableCell(withIdentifier: Constant.tableviewCell.headerCell) as! HeaderTableViewCell
        cell.nameLabel.text = productData[indexPath.section].name?.capitalized
        cell.arrowButton.tag = indexPath.section
        cell.arrowButton.setImage(UIImage(systemName: productData[indexPath.section].opened == false ? Constant.imageName.down : Constant.imageName.up), for: .normal)
        cell.arrowButton.addTarget(self, action: #selector(expandAndCollaps), for: .touchUpInside)
        return cell
        
    }
    /**
     This is class of method is responsible to get the table view cell for product cell
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    
    func getCategoryCell(indexPath:IndexPath)->UITableViewCell{
        let dataIndex = indexPath.row - 1
        let cell = tableView?.dequeueReusableCell(withIdentifier: Constant.tableviewCell.categoryCell) as! DataTableViewCell
        cell.nameLabel.text = productData[indexPath.section].subCategory?[dataIndex].name?.capitalized
        cell.descriptionLabel.text = productData[indexPath.section].subCategory?[dataIndex].displayName?.capitalized
        
        return cell
        
    }
    /**
     This is class of method is responsible to handle teh user event
     - Authors: Randhir Kumar
     - Version: 1.0(1)
     */
    @objc func expandAndCollaps(sender : UIButton) {
        
        if productData[sender.tag].opened == true {
            productData[sender.tag].opened = false
            let sections = IndexSet.init(integer: sender.tag)
            tableView?.reloadSections(sections, with: .none)
        } else {
            for index in (0 ..< productData.count) where productData[index].opened == true {
                productData[index].opened = false
                let sections = IndexSet.init(integer: index)
                tableView?.reloadSections(sections, with: .none)
            }
            
            //self.tableView.reloadData()
            productData[sender.tag].opened = true
            let sections = IndexSet.init(integer: sender.tag)
            tableView?.reloadSections(sections, with: .none)
        }
    }
    
    
    
}
