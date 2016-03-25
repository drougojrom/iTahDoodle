//
//  ViewController.swift
//  iTahDoodleSwift
//
//  Created by Roman Ustiantcev on 08/03/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var itemTextFiled: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let toDoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = toDoList
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        
        guard let text = itemTextFiled.text else {
            return
        }
        
        if itemTextFiled.text == "" {
            return
        }
        
        toDoList.addItem(text)
        tableView.reloadData()
        itemTextFiled.text = ""
        
    }
   

}

