import UIKit

class PhotoTextViewController: UIViewController {
    
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var customView: UIView!

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

class CustomView: UIView {
  
  var startPosition: CGPoint?
  var originalHeight: CGFloat = 0
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    startPosition = touch?.location(in: self)
    originalHeight = self.frame.height
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first
    let endPosition = touch?.location(in: self)
    let difference = endPosition!.y - startPosition!.y
    let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: originalHeight + difference)
    self.frame = newFrame
  }
}
