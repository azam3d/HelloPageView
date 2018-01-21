
import UIKit

class WalkthroughViewController: UIPageViewController {
    
    var images = ["channel1", "channel2", "channel3"]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        let contentController = getViewController(withIndex: 0)
        let contentControllers = [contentController]
        
        setViewControllers(contentControllers, direction: .forward, animated: true, completion: nil)
    }
    
    func getViewController(withIndex index: Int) -> WalkthroughContentViewController {
        guard let contentVC = UIStoryboard(name: "Walkthrough", bundle: nil).instantiateViewController(withIdentifier: "walkthroughContent") as? WalkthroughContentViewController else {
            fatalError()
        }
        contentVC.itemIndex = index
        contentVC.imageName = images[index]
        
        return contentVC
    }
    
}

extension WalkthroughViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! WalkthroughContentViewController
        
        if contentVC.itemIndex > 0 {
            return getViewController(withIndex: contentVC.itemIndex - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! WalkthroughContentViewController
        let nextIndex = contentVC.itemIndex + 1
        
        if nextIndex < images.count {
            return getViewController(withIndex: nextIndex)
        }
        return nil
    }
    
}
