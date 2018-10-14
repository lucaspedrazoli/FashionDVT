import UIKit
import Lottie

class ViewController: UIViewController {

  @IBOutlet var animationView: LOTAnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "rocket")
    animationView.contentMode = .scaleAspectFill
    animationView.play()
  }
}
