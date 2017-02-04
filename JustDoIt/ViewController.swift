//
//  ViewController.swift
//  JustDoIt
//
//  Created by Mac Owner on 1/28/17.
//  Copyright © 2017 shash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTask()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            
            cell.textLabel?.text = "‼️\(task.name)"
            
        } else {
            cell.textLabel?.text = task.name
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTask() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Talk"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Chalk"
        task3.important = false
        
        return [task1, task2, task3]
        
        
        
    }
    
    @IBAction func plusTapped(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "showSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSegue" {
            
            
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
            
        }
        
        if segue.identifier == "selectTaskSegue" {
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
            
        }
        
    }
    
    
}

