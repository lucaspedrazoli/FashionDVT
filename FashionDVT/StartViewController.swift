import UIKit
import RQShineLabel

class StartViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: RQShineLabel!
  @IBOutlet weak var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    button.backgroundColor = .clear
    presentationText()
  }

  private func addSwipeGesture() {
    image.isUserInteractionEnabled = true
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
    swipe.direction = .right
    image.addGestureRecognizer(swipe)
  }

  private func presentationText() {
    label.text = "Novos Designers"
    label.shine(completion: {
      self.label.fadeOut(completion: {
        self.nextText()
      })
    })
  }

  private func nextText() {
    label.text = "Deslize >"
    self.addSwipeGesture()
    label.shine(completion: {
      self.label.fadeOut(completion: {
        self.presentationText()
      })
    })
  }

  @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
    self.performSegue(withIdentifier: "showMenuGallery", sender: nil)
  }
  
  @IBAction func next() {
    self.performSegue(withIdentifier: "showMenuGallery", sender: nil)
  }
}
