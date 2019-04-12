//
//  ViewController.swift
//  ToDo
//
//  Created by Raj on 4/11/19.
//  Copyright © 2019 Raj. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    
    let itemArray = ["Pack bag", "Go to Seattle", "call hemi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }


}

