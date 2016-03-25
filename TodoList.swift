//
//  TodoList.swift
//  iTahDoodleSwift
//
//  Created by Roman Ustiantcev on 08/03/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    
    
    private let fileURL: NSURL = {
        let documentDirectoryURLs = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.URLByAppendingPathComponent("toDoList.items")
    }()

    private var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems(){
        let itemsArray = items as NSArray
        print("Saving items to \(fileURL)")
        if !itemsArray.writeToURL(fileURL, atomically: true){
            print("Could not save to fileURL")
        }
    }
    
    func loadItems(){
        if let itemsArray = NSArray(contentsOfURL: fileURL) as? [String]{
            items = itemsArray
        }
    }
    
    func addItem(item: String){
        items.append(item)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
}
