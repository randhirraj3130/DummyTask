
import Foundation
import UIKit


class Constant {
    
    
    enum tableviewCell {
        static let headerCell  = "HeaderTableViewCell"
        static let categoryCell  = "DataTableViewCell"
    }
    enum imageName {
        static let down  = "arrow.down"
        static let up  = "arrow.up"
    }
}

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}
