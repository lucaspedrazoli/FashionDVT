import UIKit

class PhotoCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var image: UIImageView!

  static func dequeueFor(_ collectionView: UICollectionView, indexPath: IndexPath, title: String, image: UIImage) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    cell.label.text = title
    cell.image.image = image
    cell.image.layer.borderColor = UIColor.black.cgColor
    cell.image.layer.borderWidth = 1
    return cell
  }
}
