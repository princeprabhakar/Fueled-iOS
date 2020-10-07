
import UIKit

class CommentsViewController: UIViewController {

    //MARK:- Variables
    fileprivate var viewModel = CommentsViewModel()
    fileprivate var arrComments: [Comments]?
    public var postId: Int?
    
    //MARK:- Outlets
    @IBOutlet weak var tblComments: UITableView!
    
    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        setNavigationBar(withTitleMode: .always, hideLeftItem: false)
        let data = Resource.comments.data()
        viewModel.getComments(from: postId, with: data) { (comments) in
            self.arrComments = comments
        }
    }
}

//MARK:- TableView Delegates & Datasource
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrComments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row + 1). Comment Body: \(arrComments?[indexPath.row].body ?? "")"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
