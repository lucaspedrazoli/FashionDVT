import UIKit
import RQShineLabel
import TransitionButton

class TextIntroViewController: UIViewController {

  @IBOutlet var label: RQShineLabel!
  @IBOutlet var button: TransitionButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    buttonLayout()
    button.startAnimation()
    labelLayout()
    label.shine(completion: {
      self.label.fadeOut(completion: {
        self.button.stopAnimation()
      })
    })
  }

  @IBAction func navigate() {
    button.stopAnimation(animationStyle: .expand, completion: {
      let secondVC = UIViewController()
      self.present(secondVC, animated: true, completion: nil)
    })
  }

  private func buttonLayout() {
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2
    button.cornerRadius = 20
    button.spinnerColor = .red
    button.setTitle("iniciar", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
  }

  private func labelLayout() {
  label.numberOfLines = 0
  label.text = "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime."
  label.backgroundColor = .clear
  label.fadeoutDuration = 2
  label.shineDuration = 4
  }
}



