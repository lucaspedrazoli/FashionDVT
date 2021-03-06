import UIKit

class TextView: UITextView, UIGestureRecognizerDelegate {

  lazy var completion: () -> Void = {}
  var marginBottom: CGFloat = 150
  var swipeLeft: () -> Void = { }
  var swipeRight: () -> Void = { }

  override func awakeFromNib() {
    super.awakeFromNib()
    isEditable = false
    let color = UIColor(red: 0.87, green: 0.89, blue: 0.89, alpha: 0.5)
    backgroundColor = color
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 0.3
    isScrollEnabled = false
    addDragGesture()
    addSwipeGestures()
  }
  
  @objc func back() {
    swipeRight()
  }
  
  @objc func foward() {
    swipeLeft()
  }

  @objc func drag(_ recognizer: UIPanGestureRecognizer) {
    let currentPoint = recognizer.location(in: self)
    if recognizer.state == .changed {
      frame.size.height = currentPoint.y
      frame.size.width = currentPoint.x
    } else if recognizer.state == .ended {
      finishDrag()
    }
  }

  @objc func textReadConfig() {
    isScrollEnabled = true
    isUserInteractionEnabled = true
    flashScrollIndicators()
    for recognizer in gestureRecognizers ?? [] {
      if recognizer.name == "drag" {
        removeGestureRecognizer(recognizer)
      }
    }
    completion()
  }
  
  private func addSwipeGestures() {
    let back = UISwipeGestureRecognizer(target: self, action: #selector(self.back))
    let foward = UISwipeGestureRecognizer(target: self, action: #selector(self.foward))
    back.direction = .right
    foward.direction = .left
    addGestureRecognizer(back)
    addGestureRecognizer(foward)
  }

  private func addDragGesture() {
    let recognizer = UIPanGestureRecognizer(target: self, action: #selector(drag(_:)))
    recognizer.delegate = self
    recognizer.name = "drag"
    addGestureRecognizer(recognizer)
  }

  private func finishDrag() {
    let dragLimit: CGFloat = 156 * 1.20
    if frame.height > dragLimit {
      changeSizeAnimation()
    } else {
      UIView.animate(withDuration: 0.3, animations: { [unowned self] in
        self.resetHeight()
      })
    }
  }

  private func resetHeight() {
    frame.size.height = 156
    frame.size.width = 149
  }

  private func changeSizeAnimation() {
    UIView.animate(withDuration: 0.3, animations: { [unowned self] in
      self.frame.size.height = self.superview!.frame.height - self.marginBottom
      self.frame.size.width = self.superview!.frame.width - 30
      }, completion: { [unowned self] (_) in
        self.textReadConfig()
    })
  }
}
