
import UIKit

class WalkthroughViewController: UIPageViewController {
    
    var images = ["channel1", "channel2", "channel3"]
    
    fileprivate func getViewController(withIndex index: Int) -> WalkthroughContentViewController {
        guard let contentVC = UIStoryboard(name: "Walkthrough", bundle: nil).instantiateViewController(withIdentifier: "walkthroughContent") as? WalkthroughContentViewController else {
            fatalError()
        }
        contentVC.itemIndex = index
        contentVC.imageName = images[index]
        
        return contentVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        let contentController = getViewController(withIndex: 0)
        let contentControllers = [contentController]
        
        setViewControllers(contentControllers, direction: .forward, animated: true, completion: nil)
        
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
        //        guard let viewControllerIndex = images.index(of: viewController) else { return nil }
        //
        //        let nextIndex = viewControllerIndex + 1
        //
        //        guard nextIndex < images.count else { return pages.first }
        //
        //        guard images.count > nextIndex else { return nil         }
        //
        //        return images[nextIndex]
        let contentVC = viewController as! WalkthroughContentViewController
        
        if contentVC.itemIndex + 1 < images.count {
            return getViewController(withIndex: contentVC.itemIndex + 1)
        }
        return nil
    }
    
}

@objc
extension WalkthroughViewController: UIPageViewControllerDelegate { }
