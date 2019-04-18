//
//  ViewController.swift
//  ToDo
//
//  Created by Raj on 4/11/19.
//  Copyright © 2019 Raj. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var newItem = Item()
        newItem.title = "Bellevue tom"
        itemArray.append(newItem)
        
        var newItem2 = Item()
        newItem2.title = "Call Hemi"
        itemArray.append(newItem2)
        
        var newItem3 = Item()
        newItem3.title = "Pack the bag"
        itemArray.append(newItem3)
        
                if let item = defaults.array(forKey: "toDoList") as? [Item] {
            itemArray = item
        }
    }
    
    
    
    //MARK - Table View Datasource methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isDone == true ? .checkmark : .none
        
        //Using ternary operator reduces below 5 lines of code
//        if item.isDone == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }

    //MARK - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        
        // Above line reduces next 5 line of code
//        if itemArray[indexPath.row].isDone == false {
//            itemArray[indexPath.row].isDone = true
//        }else{
//            itemArray[indexPath.row].isDone = false
//        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Adding New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter the Task"
            textField = alertTextField
        }
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (alert) in
            
            var nItem = Item()
            nItem.title = textField.text!
            self.itemArray.append(nItem)
            
            self.defaults.set(self.itemArray,forKey: "toDoList")
            
            self.tableView.reloadData()
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

