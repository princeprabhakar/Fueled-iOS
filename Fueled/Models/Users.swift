
import Foundation

struct Users: Decodable {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var latitute: String?
    var longitude: String?
    var phoneNumber: String?
    var website: String?
    var companyName: String?
    var companyCatchPhrase: String?
    var companyBS: String?
    
    private enum UserKeys: String, CodingKey {
        case id, name, username, email, address, phone, website, company
    }
    
    private enum AddressKeys: String, CodingKey {
        case street, suite, city, zipcode, geo
    }
    
    private enum GeoLocationKeys: String, CodingKey {
        case lat
        case long = "lng"
    }
    
    private enum CompanyKeys: String, CodingKey {
        case companyName = "name"
        case companyCatchPhrase = "catchPhrase"
        case companyBS = "bs"
    }
    
    func encode(to encode: Encoder) throws {
            
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: UserKeys.self)

        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)    
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
        
        let address = try values.nestedContainer(keyedBy: AddressKeys.self, forKey: .address)
        street = try address.decode(String.self, forKey: .street)
        suite = try address.decode(String.self, forKey: .suite)
        zipcode = try address.decode(String.self, forKey: .zipcode)
        
        let geoLocation = try address.nestedContainer(keyedBy: GeoLocationKeys.self, forKey: .geo)
        latitute = try geoLocation.decode(String.self, forKey: .lat)
        longitude = try geoLocation.decode(String.self, forKey: .long)
        
        phoneNumber = try values.decode(String.self, forKey: .phone)
        website = try values.decode(String.self, forKey: .website)
        
        let company = try values .nestedContainer(keyedBy: CompanyKeys.self, forKey: .company)
        companyName = try company.decode(String.self, forKey: .companyName)
        companyCatchPhrase = try company.decode(String.self, forKey: .companyCatchPhrase)
        companyBS = try company.decode(String.self, forKey: .companyBS)
    }
}

struct AverageComments {
    var name: String
    var id: Int
    var avgComments: Double
}
