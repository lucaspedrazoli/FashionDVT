import UIKit
import Lottie

class IssueFourIntroViewController: UIViewController {
  
  @IBOutlet weak var animationView: AnimationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "anima_weme")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
