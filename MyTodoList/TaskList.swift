//
//  TaskList.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/11.
//

import Foundation

struct TaskList {
    
    let today = Date()
    static var list: [Task] = [
    ].sorted(by: {$0.dueDate < $1.dueDate})
    
    static func doneList() -> [Task] {
        return list.filter{ $0.isDone == true }
    }
    
    static func updateIsDone(task: Task, isDone: Bool) {
        
    }
    
    static func updateTask(task: Task) {
        
    }
    
    static func deleteTask(id: UUID) {
        list.removeAll(where: {$0.id == id})
    }
    
}
