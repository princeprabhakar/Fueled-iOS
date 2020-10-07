
import UIKit

class ViewController: UIViewController {
    
    //MARK:- Variables
    fileprivate var viewModel: UserViewModel?
    fileprivate var arrUsers: [Users]?
    fileprivate var arrAverage: [AverageComments] = []
    
    //MARK:- Outlets
    @IBOutlet weak var tblUsers: UITableView!
    
    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setNavigationBar(withTitleMode: .always, hideLeftItem: true)
        viewModel = UserViewModel()
        let userData = Resource.users.data()
        viewModel?.getUsers(from: userData, completion: { [weak self] (avgComments) in
            guard let self = self else { return }
            if let avgComments = avgComments {
                self.arrAverage = avgComments
            }
        })
    }
}

//MARK:- TableView Delegates & Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAverage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        let dict = arrAverage[indexPath.row]
        debugPrint(dict)
        cell.textLabel?.text = "\(indexPath.row + 1). Name: \(dict.name) \n\nUser ID- \(dict.id) \n\nAverage Comments- \(dict.avgComments)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.instantiatePostsVC()
        vc.userId = arrAverage[indexPath.row].id
        self.push(to: vc)
    }
}
