import UIKit

class IssueEightTextViewController: UIViewController {
  
  @IBOutlet weak var textView: TextView!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var image: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSwipeGestures()
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
