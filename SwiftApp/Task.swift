import Foundation
import SwiftData

@Model 
class Task: {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false

    init(title: "", isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}