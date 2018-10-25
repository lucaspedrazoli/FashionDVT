import UIKit

class GalleryMenuViewController: UIViewController {

  @IBOutlet weak var scroll: UIScrollView!
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
  @IBOutlet var animations: [AnimationLoop] = []


  override func viewDidLoad() {
    super.viewDidLoad()
    pic1.setAnimation(named: "spinning_cat")
    pic2.setAnimation(named: "ace_of_cards")
    pic3.setAnimation(named: "cat_paw")
    pic4.setAnimation(named: "deadpool")
    pic5.setAnimation(named: "empty")
    pic6.setAnimation(named: "gaming_pad")
    pic7.setAnimation(named: "green_monster")
    pic8.setAnimation(named: "like")
    pic9.setAnimation(named: "one")
    pic10.setAnimation(named: "thumbs_up")
    animations.forEach { animation in
      let gesture = UITapGestureRecognizer(target: self, action: #selector(GalleryMenuViewController.next as (GalleryMenuViewController) -> () -> ()))
      animation.addGestureRecognizer(gesture)
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    scroll.contentSize = CGSize(width: view.frame.width, height: 2000)
  }

  @objc func next() {
    let animation = AnimationView(name: "thumbs_up")
    animation.backgroundColor = .black
    animation.alpha = 0
    animation.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    UIView.animate(withDuration: 1, animations: {
      self.view.addSubview(animation)
      animation.alpha = 1
      animation.play { _ in
        self.performSegue(withIdentifier: "next", sender: nil)
      }
    })
  }

}
