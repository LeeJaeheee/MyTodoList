//
//  DoneListTableViewController.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/11.
//

import UIKit

class DoneListTableViewController: UITableViewController {
    
    var uniqueDueDates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uniqueDueDates = Array(Set(TaskList.doneList().map { $0.dueDate })).sorted()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return uniqueDueDates.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tasksForSection = TaskList.doneList().filter { $0.dueDate == uniqueDueDates[section] }
        return tasksForSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DateFormatter.dateFormatter.string(from: uniqueDueDates[section])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as! TodoListTableViewCell
        
        let tasksForSection = TaskList.doneList().filter { $0.dueDate == uniqueDueDates[indexPath.section] }.sorted(by: { $0.time < $1.time })
        let task = tasksForSection[indexPath.row]
        
        cell.task = task
        cell.configure(_task: task)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let tasksForSection = TaskList.list.filter { $0.dueDate == uniqueDueDates[indexPath.section] }.sorted(by: { $0.time < $1.time })
            let task = tasksForSection[indexPath.row]
            
            TaskList.deleteTask(id: task.id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
