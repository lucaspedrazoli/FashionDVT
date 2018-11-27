import UIKit
import Lottie

class IssueOneIntroViewController: UIViewController {

  @IBOutlet weak var animationView: AnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "anima_ensou_v2")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
