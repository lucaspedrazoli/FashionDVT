import UIKit
import RQShineLabel
import TransitionButton
import Hero

class TextIntroViewController: UIViewController {

  @IBOutlet var label: RQShineLabel!
  @IBOutlet var button: TransitionButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    buttonLayout()
    labelLayout()
    label.shine(completion: {
      self.button.startAnimation()
      self.label.fadeOut(completion: {
        self.button.stopAnimation()
      })
    })
  }

  @IBAction func navigate(sender: UIButton) {
    button.stopAnimation(animationStyle: .expand, completion: { [unowned self] in
      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let gallery = storyBoard.instantiateViewController(withIdentifier: "Gallery") as! GalleryViewController
      self.present(gallery, animated: true, completion: nil)
    })
  }

  private func buttonLayout() {
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.cornerRadius = 5
    button.spinnerColor = .white
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

