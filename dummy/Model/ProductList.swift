import Foundation
import UIKit

struct ProductList : Codable {
    
    let name : String?
    let subCategory : [SubCategory]?
    var opened : Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case subCategory = "sub_category"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subCategory = try values.decodeIfPresent([SubCategory].self, forKey: .subCategory)
        opened = false
    }
}
