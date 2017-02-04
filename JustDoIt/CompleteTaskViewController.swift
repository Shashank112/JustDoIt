//
//  CompleteTaskViewController.swift
//  JustDoIt
//
//  Created by Mac Owner on 2/3/17.
//  Copyright © 2017 shash. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
   
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
            navigationController!.popViewController(animated: true)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if task.important {
            
            taskLabel.text = "‼️\(task.name!)"
            
        } else {
            taskLabel.text = task.name!
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
