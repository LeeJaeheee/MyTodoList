//
//  ViewController.swift
//  MyTodoList
//
//  Created by 이재희 on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoButton.circleButton = true
        doneButton.circleButton = true
    }


}

