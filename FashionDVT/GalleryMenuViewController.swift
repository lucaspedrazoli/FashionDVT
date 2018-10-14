import UIKit

class GalleryMenuViewController: UIViewController {

  @IBOutlet weak var pic1: AnimationLoop!
  @IBOutlet weak var pic2: AnimationLoop!
  @IBOutlet weak var pic3: AnimationLoop!
  @IBOutlet weak var pic4: AnimationLoop!
  @IBOutlet weak var pic5: AnimationLoop!
  @IBOutlet weak var pic6: AnimationLoop!
  @IBOutlet weak var pic7: AnimationLoop!
  @IBOutlet weak var pic8: AnimationLoop!
  @IBOutlet weak var pic9: AnimationLoop!
  @IBOutlet weak var pic10: AnimationLoop!

  override func viewDidLoad() {
    super.viewDidLoad()
    pic1.setAnimation(named: "spinning_cat")
    pic1.play()
  }

}
