//
//  TodoListTableViewController.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/11.
//

import UIKit

class TodoListTableViewController: UITableViewController, UITextFieldDelegate {
    
    var titleTextField: UITextField!
    var dueDateTextField: UITextField!
    var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        let uniqueDueDates = Set(TaskList.list.map { $0.dueDate })
//        return uniqueDueDates.count
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let uniqueDueDates = Array(Set(TaskList.list.map { $0.dueDate }))
//        let tasksForSection = TaskList.list.filter { $0.dueDate == uniqueDueDates[section] }
//        return tasksForSection.count
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let uniqueDueDates = Array(Set(TaskList.list.map { $0.dueDate }))
//        let dateFormatter = DateFormatter.dateFormatter
//        return dateFormatter.string(from: uniqueDueDates[section])
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        let uniqueDueDates = Array(Set(TaskList.list.map { $0.dueDate }))
//        let tasksForSection = TaskList.list.filter { $0.dueDate == uniqueDueDates[indexPath.section] }
//        let task = tasksForSection[indexPath.row]
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as! TodoListTableViewCell
//        let dates = Array(viewModel.groupedTodos.keys.sorted())
//        let date = dates[indexPath.section]
//        if let todo = viewModel.groupedTodos[date]?[indexPath.item] {
//            cell.configure(todo)
//        }
//
//        return cell
//    }
//
    
    @IBAction func addTaskButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { [self] textField in
            textField.placeholder = "Title"
            titleTextField = textField
            titleTextField.delegate = self
        }
        
        alertController.addTextField { [self] textField in
            textField.placeholder = "Due Date (yyyy/MM/dd)"
            textField.keyboardType = .numbersAndPunctuation
            dueDateTextField = textField
            dueDateTextField.delegate = self
        }
        
        alertController.addTextField { [self] textField in
            textField.placeholder = "Time (HH:mm)"
            textField.keyboardType = .numbersAndPunctuation
            timeTextField = textField
            timeTextField.delegate = self
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [self] _ in
            if let title = titleTextField.text,
               let dueDateString = dueDateTextField.text,
               let timeString = timeTextField.text,
               let dueDate = DateFormatter.dateFormatter.date(from: dueDateString),
               let time = DateFormatter.timeFormatter.date(from: timeString),
               !title.isEmpty, !dueDateString.isEmpty, !timeString.isEmpty {
                TaskList.list.append(Task(title: title, dueDate: dueDate, time: time))
                print(TaskList.list)
            } else {
                self.showInvalidInputAlert()
            }
        }
        
        alertController.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == titleTextField {
            if let text = textField.text {
                if text.isEmpty {
                    textField.placeholder = "Invalid Title"
                    textField.placeholderColor = .red
                    textField.text = ""
                } else {
                    textField.placeholder = "Title"
                    textField.placeholderColor = .black
                    dueDateTextField.becomeFirstResponder()
                }
            }
        } else if textField == dueDateTextField {
            if let text = textField.text {
                if DateFormatter.dateFormatter.date(from: text) == nil || text.isEmpty {
                    textField.placeholder = "Invalid Date (yyyy/MM/dd)"
                    textField.placeholderColor = .red
                    textField.text = ""
                } else {
                    textField.placeholder = "Due Date (yyyy/MM/dd)"
                    textField.placeholderColor = .black
                    timeTextField.becomeFirstResponder()
                }
            }
        } else if textField == timeTextField {
            if let text = textField.text {
                if DateFormatter.timeFormatter.date(from: text) == nil || text.isEmpty {
                    textField.placeholder = "Invalid Time (HH:mm)"
                    textField.placeholderColor = .red
                    textField.text = ""
                } else {
                    textField.placeholder = "Time (HH:mm)"
                    textField.placeholderColor = .black
                    textField.resignFirstResponder()
                }
            }
        }
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    func showInvalidInputAlert() {
        let alert = UIAlertController(title: "Invalid Input", message: "Please fill in all fields correctly.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}

