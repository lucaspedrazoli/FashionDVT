import Lottie

class AnimationView: LOTAnimationView {

  override func awakeFromNib() {
    super.awakeFromNib()
    contentMode = .scaleAspectFill
  }

}
