import UIKit
import Hero
import ViewAnimator

class IssueOneGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!
  let images: [UIImage?] = [UIImage(named: "pauta1_photo7"),UIImage(named: "pauta1_photo1"),UIImage(named: "pauta1_photo9"),UIImage(named: "pauta1_photo_10"),UIImage(named: "pauta1_photo6"),UIImage(named: "pauta1_photo_11"),UIImage(named: "pauta1_photo3"),UIImage(named: "pauta1_photo5")]

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib(nibName: "PhotoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoCell")
    collectionView.alpha = 0
    collectionLayout()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    let fromAnimation = AnimationType.from(direction: .bottom, offset: 60.0)
    let cells = self.collectionView.visibleCells
    UIView.animate(withDuration: 0.5, animations: {
      self.collectionView.alpha = 1
      UIView.animate(views: cells, animations: [fromAnimation])
    })
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let title = ""
    let image = images[indexPath.row]
    let cell = PhotoCell.dequeueFor(collectionView, indexPath: indexPath, title: title, image: image!)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let storyBoard: UIStoryboard = UIStoryboard(name: "IssueOne", bundle: Bundle.main)
    let intro = storyBoard.instantiateViewController(withIdentifier: "IssueOne") as! IssueOneIntroViewController
    self.present(intro, animated: true, completion: nil)
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