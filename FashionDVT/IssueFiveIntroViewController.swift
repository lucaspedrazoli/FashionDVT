import UIKit
import Lottie

class IssueFiveIntroViewController: UIViewController {
  
  @IBOutlet weak var animationView: AnimationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "anima_arte")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
