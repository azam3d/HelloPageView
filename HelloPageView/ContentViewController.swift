
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
    }
    
}

