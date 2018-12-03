import UIKit
import Hero
import ViewAnimator

class IssueThreeGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collectionView: UICollectionView!
  let images: [UIImage?] = [UIImage(named: "pauta3_photo2"),UIImage(named: "pauta3_photo3"),UIImage(named: "pauta3_photo4"),UIImage(named: "pauta3_photo5"),UIImage(named: "pauta3_photo6"),UIImage(named: "pauta3_photo7"),UIImage(named: "pauta3_photo8"),UIImage(named: "pauta3_photo9")]
  
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let name = images[indexPath.row]
    performSegue(withIdentifier: "showPhoto", sender: name)
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! IssueThreePhotoViewController
    destination.image = (sender as! UIImage)
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
  
  private func addSwipeGestures() {
    collectionView.isUserInteractionEnabled = true
    let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack(sender:)))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeQuit(sender:)))
    swipeBack.direction = .right
    swipeDown.direction = .down
    collectionView.addGestureRecognizer(swipeBack)
    collectionView.addGestureRecognizer(swipeDown)
  }
  
  @objc func swipeQuit(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.collectionView.alpha = 0
      self.navigationController?.popToRootViewController(animated: true)
    })
  }
  
  @objc func swipeBack(sender: UISwipeGestureRecognizer) {
    UIView.animate(withDuration: 0.5, animations: {
      self.collectionView.alpha = 0
      self.navigationController?.popViewController(animated: true)
    })
  }
}
