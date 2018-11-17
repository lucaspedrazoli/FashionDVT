import UIKit

class TextView: UITextView, UIGestureRecognizerDelegate {

  override func awakeFromNib() {
    super.awakeFromNib()
    let color = UIColor(red: 0.87, green: 0.89, blue: 0.89, alpha: 0.5)
    backgroundColor = color
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 0.3
    addDragGesture()
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
      removeGestureRecognizer(recognizer)
    }

  }

  private func addDragGesture() {
    let recognizer = UIPanGestureRecognizer(target: self, action: #selector(drag(_:)))
    recognizer.delegate = self
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
      self.frame.size.height = self.superview!.frame.height - 100
      self.frame.size.width = self.superview!.frame.width - 30
      }, completion: { [unowned self] (_) in
        self.textReadConfig()
    })
  }
}
