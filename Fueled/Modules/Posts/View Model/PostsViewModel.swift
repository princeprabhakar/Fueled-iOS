
import Foundation

final class PostsViewModel {
    
    //MARK:- Variables
    fileprivate var arrPosts: [Posts]?
    
    //MARK:- Parsing posts into model
    func getPosts(from userId: Int?, with data: Data, completion: @escaping ([Posts]?) -> ()) {
        do {
            let posts = try JSONDecoder().decode([Posts].self, from: data)
            if let userId = userId {
                self.arrPosts = posts.filter({ $0.userId == userId })
                completion(self.arrPosts)
            }
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
