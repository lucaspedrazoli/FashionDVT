import UIKit
import RQShineLabel

class TextIntroViewController: UIViewController {

  @IBOutlet var label: RQShineLabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    label.numberOfLines = 0
    label.text = "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime."
    label.backgroundColor = .clear
    label.fadeoutDuration = 5
    label.shineDuration = 5
    label.shine(completion: {
      self.label.fadeOut()
    })
  }
}
