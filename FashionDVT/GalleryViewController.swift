import UIKit
import Hero
import ViewAnimator

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib(nibName: "PhotoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoCell")
    collectionView.alpha = 0
    collectionLayout()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    let fromAnimation = AnimationType.from(direction: .bottom, offset: 30.0)
    let cells = self.collectionView.visibleCells
    UIView.animate(withDuration: 1, animations: {
      self.collectionView.alpha = 1
      UIView.animate(views: cells, animations: [fromAnimation])
    })
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = PhotoCell.dequeueFor(collectionView, indexPath: indexPath)
    return cell
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
  }

  private func collectionLayout() {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
    collectionView.collectionViewLayout = layout
  }

}
