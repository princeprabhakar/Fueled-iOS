
import Foundation

final class UserViewModel {
    
    //MARK:- Variables
    fileprivate var postsData: Data?
    fileprivate var commentsData: Data?
    fileprivate var commentsCount: Int = 0
    fileprivate var postsCount: Int = 0
    fileprivate var arrUsers: [Users]?
    fileprivate var arrAverage: [AverageComments] = []
    
    init() {
        postsData = Resource.posts.data()
        commentsData = Resource.comments.data()
    }
    
    //MARK:- Parsing users into model
    func getUsers(from data: Data, completion: @escaping ([AverageComments]?) -> ()) {
        do {
            let users = try JSONDecoder().decode([Users].self, from: data)
            self.arrUsers = users
            for user in users {
                if let data = self.postsData, let id = user.id, let name = user.name {
                    self.getPosts(from: id, and: name, with: data)
                }
                let dict = AverageComments(name: user.name!, id: user.id!, avgComments: Double(Double(commentsCount)/Double(postsCount)))
                arrAverage.append(dict)
                commentsCount = 0
                postsCount = 0
            }
            arrAverage = arrAverage.sorted(by: { $0.avgComments > $1.avgComments })
            completion(arrAverage)
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
        
    //MARK:- Parsing Posts into model
    fileprivate func getPosts(from userId: Int, and name: String, with data: Data) {
        do {
            let posts = try JSONDecoder().decode([Posts].self, from: data)
            let arrPosts = posts.filter({ return $0.userId == userId })
            postsCount = arrPosts.count
            for post in arrPosts {
                if let data = self.commentsData, let id = post.id {
                    getComments(from: id, and: userId, and: name, with: data)
                }
            }
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
    
    //MARK:- Parsing Comments into model
    fileprivate func getComments(from postId: Int, and userId: Int, and name: String, with data: Data) {
        do {
            let comments = try JSONDecoder().decode([Comments].self, from: data)
            let arrComments = comments.filter({ $0.postId == postId })
            commentsCount += arrComments.count
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
