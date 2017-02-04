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
    var previousVC = ViewController()
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if task.important {
            
            taskLabel.text = "‼️\(task.name)"
            
        } else {
            taskLabel.text = task.name
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
