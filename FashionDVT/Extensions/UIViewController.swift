import UIKit

class TestViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gestures()
  }
  
  private func gestures() {
    view.isUserInteractionEnabled = true
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(back(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(quit(sender:)))
    swipeLeft.direction = .left
    swipeDown.direction = .down
    view.addGestureRecognizer(swipeLeft)
    view.addGestureRecognizer(swipeDown)
  }
  
  @objc func quit(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func back(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.navigationController?.popViewController(animated: true)
    })
  }
  
}
