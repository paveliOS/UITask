import UIKit

protocol HomeView: class {
    func updateLists()
}

final class HomeViewController: UIViewController {
    
    @IBOutlet private var menuButton: UIButton!
    @IBOutlet private var datesCollectionView: UICollectionView!
    @IBOutlet private var tasksCollectionView: UICollectionView!
    
    var presenter: HomeViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let revealVC = revealViewController() {
            menuButton.addTarget(revealVC, action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case datesCollectionView:
            return presenter.dates.count
        case tasksCollectionView:
            guard let selectedDate = presenter.dates.filter({ $0.shouldHighlight }).first else {
                return 0
            }
            return selectedDate.tasks.count
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case datesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell.identifier, for: indexPath) as! DateCell
            let date = presenter.dates[indexPath.row]
            cell.setData(viewData: date)
            return cell
        case tasksCollectionView:
            guard let selectedDate = presenter.dates.filter({ $0.shouldHighlight }).first else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
            let task = selectedDate.tasks[indexPath.row]
            cell.setData(viewData: task)
            return cell
        default:
            fatalError()
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case datesCollectionView:
            presenter.didSelectDate(atIndexPath: indexPath)
        case tasksCollectionView:
            break
        default:
            break
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case datesCollectionView:
            let cellWidth = collectionView.bounds.width / 7
            let size = CGSize(width: cellWidth, height: cellWidth)
            return size
        case tasksCollectionView:
            let cellHeight = collectionView.bounds.height
            let size = CGSize(width: cellHeight, height: cellHeight)
            return size
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case datesCollectionView:
            return collectionView.bounds.height * 0.024
        case tasksCollectionView:
            return collectionView.bounds.height * 0.03
        default:
            fatalError()
        }
    }
    
}

extension HomeViewController: HomeView {
    
    func updateLists() {
        datesCollectionView.reloadData()
        tasksCollectionView.reloadData(animated: true)
    }
    
}

