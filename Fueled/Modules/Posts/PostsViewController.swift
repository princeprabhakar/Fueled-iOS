
import UIKit

class PostsViewController: UIViewController {

    //MARK:- Variables
    fileprivate var viewModel = PostsViewModel()
    fileprivate var arrPosts: [Posts]?
    public var userId: Int?
    
    //MARK:- Outlets
    @IBOutlet weak var tblComments: UITableView!

    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        setNavigationBar(withTitleMode: .always, hideLeftItem: false)
        let data = Resource.posts.data()
        viewModel.getPosts(from: userId, with: data, completion: { (posts) in
            self.arrPosts = posts
        })
    }
}

//MARK:- TableView Delegates & Datasource
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPosts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1). Post Title: \(arrPosts?[indexPath.row].title ?? "") \n\nPost Body: \(arrPosts?[indexPath.row].body ?? "")"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let postId = arrPosts?[indexPath.row].id {
            let vc = UIStoryboard.instantiateCommentsVC()
            vc.postId = postId
            self.push(to: vc)
        }
    }
}
