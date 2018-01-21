
import UIKit

class WalkthroughContentViewController: UIViewController {
    
    var itemIndex = 0
    var imageName: String?
    
    @IBOutlet weak var contentView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageName {
            contentView.image = UIImage(named: imageName)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(openNextPage))
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(tap)
    }
    
    @objc private func openNextPage() {
        let parentVC = self.parent as! WalkthroughViewController
        
        if itemIndex + 1 < parentVC.images.count {
            parentVC.setViewControllers([parentVC.getViewController(withIndex: itemIndex + 1)], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
}

