import UIKit

class PhotoCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var container: UIView!

  static func dequeueFor(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    cell.label.text = "As gemas de aline"
    cell.label.textColor = .white
    cell.container.backgroundColor = .black
    cell.container.layer.borderColor = UIColor.white.cgColor
    cell.container.layer.borderWidth = 1
    return cell
  }
}
