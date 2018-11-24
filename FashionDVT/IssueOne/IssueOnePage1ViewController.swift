import UIKit
import RQShineLabel

class IssueOnePage1ViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: RQShineLabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    labelLayout()
    startAnimation()
    self.addSwipeGestures()
  }

  private func labelLayout() {
    label.textColor = .lightGray
    label.numberOfLines = 0
    label.shineDuration = 5
    label.fadeoutDuration = 3
    label.text = "\"São tempos de superficialidade, ansiedade e incerteza, e as pessoas buscam preencher esse vazio por meio do consumo desenfreado das coisas\""
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
      self.addSwipeGestures()
      self.startAnimation()
    })
  }
  
  private func addSwipeGestures() {
    image.isUserInteractionEnabled = true
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeQuit(sender:)))
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(sender:)))
    swipe.direction = .left
    swipeLeft.direction = .right
    swipeDown.direction = .down
    image.addGestureRecognizer(swipe)
    image.addGestureRecognizer(swipeLeft)
    image.addGestureRecognizer(swipeDown)
  }
  
  @objc func swipeQuit(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.image.alpha = 0
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func swipeBack(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.image.alpha = 0
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func swipeRight(sender: UISwipeGestureRecognizer) {
    self.performSegue(withIdentifier: "showTextViewController", sender: nil)
  }

}
