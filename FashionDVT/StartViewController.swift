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

  private func addPanGesture() {
    image.isUserInteractionEnabled = true
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
    label.shine(completion: {
      self.label.fadeOut(completion: {
        self.presentationText()
      })
    })
  }

  @IBAction func next() {
    self.performSegue(withIdentifier: "showText", sender: nil)
  }
}
