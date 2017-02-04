//
//  CreateTaskViewController.swift
//  JustDoIt
//
//  Created by Mac Owner on 2/2/17.
//  Copyright © 2017 shash. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    
    @IBAction func addTapped(_ sender: UIButton) {
        // Create a atsk from the outlet information
        
        let task = Task()
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        
        
        
        
        // Add new task from the outlet information
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
