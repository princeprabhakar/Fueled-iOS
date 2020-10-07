
import UIKit

extension UIViewController {
    func push(to viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setNavigationBar(withTitleMode mode: UINavigationItem.LargeTitleDisplayMode, hideLeftItem: Bool) {
        let backBtn = UIButton()
        backBtn.setImage(UIImage(named: "back"), for: .normal)
        let backBarBtnItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = hideLeftItem ? UIBarButtonItem() : backBarBtnItem
        backBtn.addTarget(self, action: #selector(self.backTapped), for: .touchUpInside)
        self.navigationItem.largeTitleDisplayMode = mode
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func backTapped() {
          self.navigationController?.popViewController(animated: true)
    }
}
