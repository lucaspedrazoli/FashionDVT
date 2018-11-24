import ViewAnimator
import UIKit

class IssueOnePhotoViewController: UIViewController {

  @IBOutlet weak var photo: UIImageView!
  var image: UIImage!

  override func viewDidLoad() {
    super.viewDidLoad()
    photo.image = image
    addSwipeGesture()
  }

  private func addSwipeGesture() {
    photo.isUserInteractionEnabled = true
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
    swipe.direction = .right
    photo.addGestureRecognizer(swipe)
  }

  @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.photo.alpha = 0
      self.navigationController?.popViewController(animated: true)
    })
  }
}
