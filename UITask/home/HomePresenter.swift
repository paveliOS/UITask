protocol HomeViewPresenter: class {
    var dates: [DateCellViewData] { get }
    func didSelectDate(atIndexPath indexPath: IndexPath)
}

final class HomePresenter {
    
    private weak var view: HomeView?
    private let router: HomeRouterProtocol
    private var dateList: [DateCellViewData]
    
    init(view: HomeView, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
        dateList = []
        generateViewData()
    }
    
    private func generateViewData() {
        let calendar = Calendar.current
        let daysCount = calendar.range(of: .day, in: .month, for: Date())!.count
        
        for i in 1...35 {
            let tasks = generateTaskCellViewData()
            let day = i <= daysCount ? i : i - daysCount
            
            let date = DateCellViewData(day: String(day), tasksExist: !tasks.isEmpty, shouldHighlight: false, tasks: tasks)
            dateList.append(date)
        }
    }
    
    private func generateTaskCellViewData() -> [TaskCellViewData] {
        var tasks: [TaskCellViewData] = []
        if arc4random() % 2 == 1 {
            let numberOfTasks = Int(arc4random()) % 4
            if numberOfTasks > 0 {
                let colors = [#colorLiteral(red: 1, green: 0.2, blue: 0.4, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.5607843137, blue: 0.431372549, alpha: 1), #colorLiteral(red: 0.3843137255, green: 0.8431372549, blue: 0.7843137255, alpha: 1)]
                let imageNames = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5"]
                for j in 1...numberOfTasks {
                    let randomNumber = Int(arc4random())
                    let color = colors[randomNumber % colors.count]
                    let involvedPeopleImageNames = Array(imageNames.prefix(Int(arc4random()) % imageNames.count))
                    let task = TaskCellViewData(time: "\(j)pm", title: "Do some stuff with someone", involvedPeopleImageNames: involvedPeopleImageNames, highlightedColor: color)
                    tasks.append(task)
                }
            }
        }
        return tasks
    }
    
}

extension HomePresenter: HomeViewPresenter {
    
    var dates: [DateCellViewData] {
        return dateList
    }
    
    func didSelectDate(atIndexPath indexPath: IndexPath) {
        let highlightedIndex = dateList.index(where: { $0.shouldHighlight })
        if highlightedIndex == indexPath.row {
            return
        }
        if let index = highlightedIndex {
            dateList[index].shouldHighlight = false
        }
        dateList[indexPath.row].shouldHighlight = true
        view?.updateLists()
    }
    
}

extension HomePresenter: MenuDelegate {
    
    func onHomeAction() {
        
    }
    
    func onSettingsAction() {
        let deadlineTime = DispatchTime.now() + .milliseconds(250)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.router.presentSettingsScreen(from: self.view!)
        }
    }
    
    func onLogoutAction() {
        let deadlineTime = DispatchTime.now() + .milliseconds(250)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.router.presentLoginScreen(from: self.view!)
        }
    }
    
}

