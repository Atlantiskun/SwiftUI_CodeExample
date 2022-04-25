//
//  Task.swift
//  SwiftUI_Examples
//
//  Created by Дмитрий Болучевских on 25.04.2022.
//

import SwiftUI

// MARK: - Task Model
struct Task: Identifiable, Comparable {
    static func < (lhs: Task, rhs: Task) -> Bool {
        lhs.taskDate < rhs.taskDate
    }
    
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
