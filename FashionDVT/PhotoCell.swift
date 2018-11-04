import UIKit

class PhotoCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var image: UIImageView!

  static func dequeueFor(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    cell.label.text = "ENSOU"
    cell.image.layer.borderColor = UIColor.black.cgColor
    cell.image.layer.borderWidth = 1
    return cell
  }
}
