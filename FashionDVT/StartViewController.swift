import UIKit
import Lottie

class StartViewController: UIViewController {

  @IBOutlet var animationView: AnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "intro_dvt")
    animationView.play{ finished in
      self.performSegue(withIdentifier: "showText", sender: nil)
    }
  }
}
