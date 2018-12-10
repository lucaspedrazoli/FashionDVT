import UIKit

class IssueSevenPhotoViewController: UIViewController {
  
  @IBOutlet weak var image: UIImageView!
  @IBInspectable var isFinal: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSwipeGestures()
    image.contentMode = .scaleAspectFill
  }
  
  private func addSwipeGestures() {
    image.isUserInteractionEnabled = true
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeQuit(sender:)))
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(sender:)))
    swipe.direction = .left
    swipeLeft.direction = .right
    swipeDown.direction = .down
    image.addGestureRecognizer(swipe)
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
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func swipeRight(sender: UISwipeGestureRecognizer) {
    if isFinal {
      navigationController?.popToRootViewController(animated: true)
    } else {
      self.performSegue(withIdentifier: "next", sender: nil)
    }
  }
}
