import UIKit
import RQShineLabel
import Lottie

class IssueOnePage1ViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: RQShineLabel!
  @IBOutlet weak var arrow: AnimationLoop!

  override func viewDidLoad() {
    super.viewDidLoad()
    animateArrow()
    labelLayout()
    startAnimation()
    animateArrow()
  }

  @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
//    self.performSegue(withIdentifier: "showMenuGallery", sender: nil)
  }

  private func labelLayout() {
    label.textColor = .lightGray
    label.numberOfLines = 0
    label.shineDuration = 5
    label.fadeoutDuration = 3
    label.text = "\"São tempos de superficialidade, ansiedade e incerteza, e as pessoas buscam preencher esse vazio por meio do consumo desenfreado das coisas\""
  }

  private func animateArrow() {
    self.arrow.backgroundColor = .clear
    self.arrow.setAnimation(named: "accept_arrows")
    self.addSwipeGesture()
  }

  private func addSwipeGesture() {
    image.isUserInteractionEnabled = true
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
    swipe.direction = .right
    image.addGestureRecognizer(swipe)
  }

  private func startAnimation() {
    self.label.shine(completion: {
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3), execute: {
        self.finishAnimation()
      })
    })
  }

  private func finishAnimation() {
    self.label.fadeOut(completion: {
      self.startAnimation()
    })
  }

}
