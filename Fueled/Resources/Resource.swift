
import Foundation

public enum Resource: String {
    case users
    case posts
    case comments

    public func data() -> Data {
        let path = Bundle.main.path(forResource: self.rawValue, ofType: "json")!
        return FileManager.default.contents(atPath: path)!
    }
}

//do {
//    if let file = Bundle.main.url(forResource: self.rawValue, withExtension: "json") {
//           return try Data(contentsOf: file)
//       }
//   } catch {
//    print(error.localizedDescription)
//    return nil
//   }
//return nil  
