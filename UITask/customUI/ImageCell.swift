import UIKit

final class ImageCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    
}

extension ImageCell {
    
    static let identifier = "Image"
    
    func setData(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}
