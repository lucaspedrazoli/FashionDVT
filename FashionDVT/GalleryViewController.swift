import UIKit
import Hero
import ViewAnimator

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
    collectionView.collectionViewLayout = layout
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    let fromAnimation = AnimationType.from(direction: .bottom, offset: 30.0)
    let cells = collectionView.visibleCells
    UIView.animate(views: cells, animations: [fromAnimation])
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .black
    cell.layer.borderColor = UIColor.white.cgColor
    cell.layer.borderWidth = 1
    return cell
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
  }



}
