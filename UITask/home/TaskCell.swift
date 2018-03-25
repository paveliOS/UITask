import UIKit

final class TaskCell: UICollectionViewCell {
    
    @IBOutlet private var labelTime: UILabel!
    @IBOutlet private var labelTitle: UILabel!
    @IBOutlet private var highlightView: UIView!
    @IBOutlet private var involvedPeopleCollectionView: UICollectionView! {
        didSet {
            involvedPeopleCollectionView.semanticContentAttribute = .forceRightToLeft
        }
    }
    @IBOutlet private var involvedPeopleDetailsLabel: UILabel!
    
    private var involvedPeopleImageNames: [String] = []
    
    
}

extension TaskCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(involvedPeopleImageNames.count, 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        let imageName = involvedPeopleImageNames[indexPath.row]
        cell.setData(imageName: imageName)
        return cell
    }
    
}

extension TaskCell: UICollectionViewDelegate {
    
}

extension TaskCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.bounds.height
        let size = CGSize(width: cellHeight, height: cellHeight)
        return size
    }
    
}



extension TaskCell {
    
    static let identifier = "Task"
    
    func setData(viewData: TaskCellViewData) {
        labelTime.text = viewData.time
        labelTitle.text = viewData.title
        highlightView.backgroundColor = viewData.highlightedColor
        involvedPeopleImageNames = viewData.involvedPeopleImageNames
        involvedPeopleCollectionView.reloadData()
        if involvedPeopleImageNames.count > 3 {
            involvedPeopleDetailsLabel.text = "+\(involvedPeopleImageNames.count - 3)"
        }
        involvedPeopleDetailsLabel.isHidden = involvedPeopleImageNames.count <= 3
        
    }
    
}
