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
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "‼️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    @IBAction func plusTapped(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "showSegue", sender: nil)
        
    }
    
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        
        } catch {
            print("Ooops! Error")
        }
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue"
            {
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
          
            
            }
        
    }
    
    
}

