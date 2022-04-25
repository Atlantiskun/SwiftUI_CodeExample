//
//  TaskViewModel.swift
//  SwiftUI_Examples
//
//  Created by Дмитрий Болучевских on 25.04.2022.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    // Sample Tasks
    @Published var storedTasks: [Task] = [
        Task(taskTitle: "Meeting", taskDescription: "Meeting Discuss", taskDate: .init(timeIntervalSince1970: 1650936600)),
        Task(taskTitle: "Icon set", taskDescription: "Icon set Discuss", taskDate: .init(timeIntervalSince1970: 1650886800)),
        Task(taskTitle: "Prototype", taskDescription: "Prototype Discuss", taskDate: .init(timeIntervalSince1970: 1650958200)),
        Task(taskTitle: "Check asset", taskDescription: "Check asset Discuss", taskDate: .init(timeIntervalSince1970: 1650981600)),
        Task(taskTitle: "Team party", taskDescription: "Team party Discuss", taskDate: .init(timeIntervalSince1970: 1650976200)),
        Task(taskTitle: "Client Meeting", taskDescription: "Client Meeting Discuss", taskDate: .init(timeIntervalSince1970: 1651028400)),
        Task(taskTitle: "Next Project", taskDescription: "Next Project Discuss", taskDate: .init(timeIntervalSince1970: 1650883200)),
        Task(taskTitle: "App Proposal", taskDescription: "Åpp Proposal Discuss", taskDate: .init(timeIntervalSince1970: 1650865200))
    ]
    
    // MARK: Current weak days
    @Published var currentWeek: [Date] = []
    
    // MARK: Current Day
    @Published var currentDate: Date = Date()
    
    // Filtering today tasks
    @Published var filteredTasks: [Task]?
    
    // MARK: Init
    init() {
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    // MARK: Filter today tasks
    func filterTodayTasks() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTasks.filter {
                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDate)
            }.sorted(by: <)
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (0...6).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    // MARK: Checking if current date is today
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    // MARK: check hour
    func isCurrentHour(date: Date) -> Bool {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
}
