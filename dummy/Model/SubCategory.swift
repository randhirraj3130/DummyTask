import Foundation
import UIKit

struct SubCategory : Codable {
    
    let displayName : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
