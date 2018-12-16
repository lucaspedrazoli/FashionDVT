import SafariServices
import UIKit

class IssueEightTextViewController: UIViewController {
  
  @IBOutlet weak var textView: TextView!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var image: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSwipeGestures()
  }
  
  @IBAction func openWebview() {
    let svc = SFSafariViewController(url: URL(string:"https://www.youtube.com/watch?v=aRvJQiGnX6w&t=235s9")!)
    self.present(svc, animated: true, completion: nil)
  }
  
  private func addSwipeGestures() {
    image.isUserInteractionEnabled = true
    let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeQuit(sender:)))
    swipeBack.direction = .right
    swipeDown.direction = .down
    image.addGestureRecognizer(swipeBack)
    image.addGestureRecognizer(swipeDown)
  }
  
  @objc func swipeQuit(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.image.alpha = 0
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func swipeBack(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.image.alpha = 0
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
}
