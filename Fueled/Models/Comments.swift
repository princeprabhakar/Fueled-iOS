
import Foundation

struct Comments: Codable {
    
    var id: Int?
    var postId: Int?
    var name: String?
    var email: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case postId
        case name
        case email
        case body
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        postId = try values.decode(Int.self, forKey: .postId)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        body = try values.decode(String.self, forKey: .body)
    }
}

