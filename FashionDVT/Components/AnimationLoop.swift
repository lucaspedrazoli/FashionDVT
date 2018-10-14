import Lottie

class AnimationLoop: LOTAnimationView {

  override func awakeFromNib() {
    super.awakeFromNib()
    contentMode = .scaleAspectFill
    loopAnimation = true
    play()
  }
}
