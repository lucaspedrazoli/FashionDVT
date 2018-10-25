import UIKit

class PhotoViewController: UIViewController {

  @IBOutlet weak var photo: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let gesture = UISwipeGestureRecognizer(target: self, action: #selector(PhotoViewController.next as (PhotoViewController) -> () -> ()))
    gesture.direction = .right
    photo.isUserInteractionEnabled = true
    photo.addGestureRecognizer(gesture)
  }

  @objc func next() {
    performSegue(withIdentifier: "next", sender: nil)
  }
}
