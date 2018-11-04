import UIKit
import Lottie

class IssueOneViewController: UIViewController {

  @IBOutlet weak var animationView: AnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "intro_ensou")
    animationView.play(completion: { _ in

    })
  }
}
