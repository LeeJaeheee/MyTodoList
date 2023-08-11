//
//  TaskList.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/11.
//

import Foundation

struct TaskList {
    
    static var list: [Task] = [
        Task(title: "일어나자🥱", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/13")!, time: DateFormatter.timeFormatter.date(from: "07:00")!),
        Task(title: "샤워하자🛀🏻", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/13")!, time: DateFormatter.timeFormatter.date(from: "07:30")!),
        Task(title: "내배캠 출석하자🎉", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/13")!, time: DateFormatter.timeFormatter.date(from: "09:00")!),
        Task(title: "TIL 쓰자✍️", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/13")!, time: DateFormatter.timeFormatter.date(from: "20:30")!),
        Task(title: "일어나자🥱", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/14")!, time: DateFormatter.timeFormatter.date(from: "07:00")!),
        Task(title: "일어나자🥱", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/15")!, time: DateFormatter.timeFormatter.date(from: "07:00")!),
        Task(title: "과제 시작하자👩🏻‍💻", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/14")!, time: DateFormatter.timeFormatter.date(from: "15:30")!),
        Task(title: "놀러 나가자💃🏻", dueDate: DateFormatter.dateFormatter.date(from: "2023/08/15")!, time: DateFormatter.timeFormatter.date(from: "14:00")!),
    ]
    
    static func doneList() -> [Task] {
        return list.filter{ $0.isDone == true }
    }
    
    static func updateIsDone(id: UUID, isDone: Bool) {
        if let i = list.firstIndex(where: {$0.id == id}) {
            list[i].isDone = isDone
        }
    }
    
    static func updateTask(id: UUID, title: String, date: Date) {
        if let i = list.firstIndex(where: {$0.id == id}) {
            list[i].title = title
            let (dateOnly, timeOnly) = Calendar.current.splitDateAndTime(from: date)
            list[i].dueDate = dateOnly
            list[i].time = timeOnly
        }
    }
    
    static func deleteTask(id: UUID) {
        list.removeAll(where: {$0.id == id})
    }
    
}
