import UIKit

class IssueOneTextViewController: UIViewController {

  @IBOutlet weak var textView: TextView!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var image: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSwipeGestures()
  }
  
  private func addSwipeGestures() {
    image.isUserInteractionEnabled = true
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeQuit(sender:)))
    swipeLeft.direction = .left
    swipeDown.direction = .down
    image.addGestureRecognizer(swipeLeft)
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
      self.navigationController?.popViewController(animated: true)
    })
  }
}
