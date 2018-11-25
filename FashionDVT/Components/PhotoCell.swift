import UIKit

class PhotoCell: UICollectionViewCell {

  @IBOutlet weak var image: UIImageView!

  static func dequeueFor(_ collectionView: UICollectionView, indexPath: IndexPath, image: UIImage) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    cell.image.image = image
    cell.image.layer.borderColor = UIColor.black.cgColor
    cell.image.layer.borderWidth = 1
    return cell
  }
}
