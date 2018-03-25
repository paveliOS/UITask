import UIKit

final class RoundButton: CustomButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }

}
