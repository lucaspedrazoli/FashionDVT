import UIKit
import Lottie

class StartViewController: UIViewController {

  @IBOutlet var animationView: AnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "rocket")
    animationView.play{ finished in
      self.performSegue(withIdentifier: "show", sender: nil)
    }
  }
}
