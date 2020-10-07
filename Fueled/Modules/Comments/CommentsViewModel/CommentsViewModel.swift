
import Foundation

final class CommentsViewModel {
    
    //MARK:- Variables
    fileprivate var arrComments: [Comments]?
    
    //MARK:- Parsing posts into model
    func getComments(from postId: Int?, with data: Data, completion: @escaping ([Comments]?) -> ()) {
        do {
            let comments = try JSONDecoder().decode([Comments].self, from: data)
            if let postId = postId {
                self.arrComments = comments.filter({ $0.postId == postId })
                completion(self.arrComments)
            }
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
