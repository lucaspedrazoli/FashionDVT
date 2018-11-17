import UIKit

class TextView: UITextView {

  override func awakeFromNib() {
    super.awakeFromNib()
    let color = UIColor(red: 0.87, green: 0.89, blue: 0.89, alpha: 0.5)
    backgroundColor = color
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 0.3

  }

}
