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
    swipe.direction = .left
    photo.addGestureRecognizer(swipe)
  }

  @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
    self.dismiss(animated: true, completion: nil)
  }

}
