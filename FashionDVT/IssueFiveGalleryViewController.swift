import UIKit
import Hero
import ViewAnimator

class IssueFiveGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collectionView: UICollectionView!
  let images: [UIImage?] = [UIImage(named: "pauta5_photo2"),UIImage(named: "pauta5_photo3"),UIImage(named: "pauta5_photo4"),
                            UIImage(named: "pauta5_photo5")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib(nibName: "PhotoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoCell")
    collectionView.alpha = 0
    collectionLayout()
    addSwipeGestures()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    if collectionView.alpha == 0 {
      let animation: AnimationType = AnimationType.from(direction: .bottom, offset: 60.0)
      let cells = self.collectionView.visibleCells
      UIView.animate(withDuration: 0.5, animations: {
        self.collectionView.alpha = 1
        UIView.animate(views: cells, animations: [animation])
      })
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let image = images[indexPath.row]
    let cell = PhotoCell.dequeueFor(collectionView, indexPath: indexPath, image: image!)
    return cell
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! IssueTwoPhotoViewController
    destination.image = (sender as! UIImage)
  }
  
  private func collectionLayout() {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    layout.itemSize = CGSize(width: screenWidth, height: screenHeight/3)
    collectionView.collectionViewLayout = layout
  }
  
  private func addSwipeGestures() {
    collectionView.isUserInteractionEnabled = true
    let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    swipeBack.direction = .right
    collectionView.addGestureRecognizer(swipeBack)
  }
  
  @objc func swipeBack(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.collectionView.alpha = 0
      self.navigationController?.popViewController(animated: true)
    })
  }
}

