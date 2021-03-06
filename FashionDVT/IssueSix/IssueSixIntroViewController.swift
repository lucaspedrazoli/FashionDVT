import UIKit
import Lottie

class IssueSixIntroViewController: UIViewController {
  
  @IBOutlet weak var animationView: AnimationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "anima_benucci_v3")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
