import UIKit
import Lottie

class IssueEightIntroViewController: UIViewController {
  @IBOutlet weak var animationView: AnimationView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "anima_indigo")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
