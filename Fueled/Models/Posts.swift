
import Foundation

struct Posts: Codable {
    
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case body
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        userId = try values.decode(Int.self, forKey: .userId)
        title = try values.decode(String.self, forKey: .title)
        body = try values.decode(String.self, forKey: .body)
    }
}
