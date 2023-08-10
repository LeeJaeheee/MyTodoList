//
//  Task.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/11.
//

import Foundation

struct Task {
    var id = UUID()
    var title: String
    var isDone = false
    var dueDate: Date
    var time: Date
}
