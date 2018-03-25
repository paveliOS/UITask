import Foundation

struct DateCellViewData {
    let day: String
    let tasksExist: Bool
    var shouldHighlight: Bool
    let tasks: [TaskCellViewData]
}
