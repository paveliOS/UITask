import UIKit

final class DateCell: UICollectionViewCell {
    
    @IBOutlet private var squareView: UIView! {
        didSet {
            squareView.layer.borderColor = #colorLiteral(red: 0.5960784314, green: 0.5803921569, blue: 1, alpha: 1)
        }
    }
    @IBOutlet private var dateLabel: UILabel!
    
}

extension DateCell {
    
    static let identifier = "Date"
    
    func setData(viewData: DateCellViewData) {
        dateLabel.text = viewData.day
        squareView.backgroundColor = viewData.tasksExist ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1) : .clear
        squareView.layer.borderWidth = viewData.shouldHighlight ? squareView.bounds.height / 18 : 0
    }
    
}
