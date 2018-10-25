import UIKit

class PhotoTextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    var panGesture = UIPanGestureRecognizer()
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(PhotoTextViewController.draggedView(_:)))
    textView.isUserInteractionEnabled = true
    textView.addGestureRecognizer(panGesture)
  }
  
  @objc func draggedView(_ sender:UIPanGestureRecognizer){
    self.view.bringSubviewToFront(textView)
    let translation = sender.translation(in: self.view)
    textView.center = CGPoint(x: textView.center.x + translation.x, y: textView.center.y + translation.y)
    sender.setTranslation(CGPoint.zero, in: self.view)
  }
}

