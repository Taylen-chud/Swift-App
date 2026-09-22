import Foundation
import SwiftData

@Model 
class Task {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
