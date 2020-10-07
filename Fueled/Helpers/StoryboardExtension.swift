
import UIKit
import Foundation

//MARK: View Controllers
enum ViewControllers {

    case usersVC, postVC, commentsVC
    
    func vcString() -> String {
        let vcString : String
        switch self {
        case .usersVC:
            vcString = "ViewController"
        case .postVC:
            vcString = "PostsViewController"
        case .commentsVC:
            vcString = "CommentsViewController"
        }
        return vcString
    }
}

//MARK: UISTORYBOARD EXTENSION
extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard  {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func instantiateUsersVC()-> ViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: ViewControllers.usersVC.vcString()) as! ViewController
    }
    
    class func instantiatePostsVC()-> PostsViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: ViewControllers.postVC.vcString()) as! PostsViewController
    }
    
    class func instantiateCommentsVC()-> CommentsViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: ViewControllers.commentsVC.vcString()) as! CommentsViewController
    }
}

