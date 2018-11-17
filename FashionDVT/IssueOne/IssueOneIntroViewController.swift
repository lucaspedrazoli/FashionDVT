import UIKit
import Lottie

class IssueOneIntroViewController: UIViewController {

  @IBOutlet weak var animationView: AnimationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    animationView.setAnimation(named: "intro_ensou")
    animationView.play(completion: { _ in
      self.performSegue(withIdentifier: "next", sender: nil)
    })
  }
}
