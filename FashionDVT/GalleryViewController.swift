import UIKit
import Hero
import ViewAnimator

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!
  let images: [UIImage?] = [UIImage(named: "capa1"),UIImage(named: "capa2"),UIImage(named: "capa3"),UIImage(named: "capa4"),UIImage(named: "capa5"),UIImage(named: "capa6"),UIImage(named: "capa7"),UIImage(named: "capa8")]
  let titles: [String] = ["ENSOU","Aline Rocha","A Arte","We.Me 3D","Lacre 21","Ricardo Benucci","Editorial","Filme Indigo"]

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib(nibName: "PhotoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoCell")
    collectionView.alpha = 0
    collectionLayout()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    if collectionView.alpha == 0 {
      let fromAnimation = AnimationType.from(direction: .left, offset: 60.0)
      let cells = self.collectionView.visibleCells
      UIView.animate(withDuration: 0.5, animations: {
        self.collectionView.alpha = 1
        UIView.animate(views: cells, animations: [fromAnimation])
      })
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let title = titles[indexPath.row]
    let image = images[indexPath.row]
    let cell = PhotoCell.dequeueFor(collectionView, indexPath: indexPath, title: title, image: image!)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let storyBoard: UIStoryboard = UIStoryboard(name: "IssueOne", bundle: Bundle.main)
    let intro = storyBoard.instantiateViewController(withIdentifier: "IssueOne") as! IssueOneIntroViewController
    navigationController?.pushViewController(intro, animated: true)
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
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
