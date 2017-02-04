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
    
    
    @IBAction func addTapped(_ sender: UIButton) {
        // Create a atsk from the outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
        
        
        // Pop Back
        
        
        navigationController!.popViewController(animated: true)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
