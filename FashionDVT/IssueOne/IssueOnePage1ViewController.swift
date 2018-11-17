import UIKit
import RQShineLabel

class IssueOnePage1ViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: RQShineLabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    labelLayout()
    startAnimation()
    self.addSwipeGesture()
  }

  @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
    self.performSegue(withIdentifier: "showTextViewController", sender: nil)
  }

  private func labelLayout() {
    label.textColor = .lightGray
    label.numberOfLines = 0
    label.shineDuration = 5
    label.fadeoutDuration = 3
    label.text = "\"São tempos de superficialidade, ansiedade e incerteza, e as pessoas buscam preencher esse vazio por meio do consumo desenfreado das coisas\""
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
      self.addSwipeGesture()
      self.startAnimation()
    })
  }

}
