//
//  ViewController.swift
//  To Do List 2
//
//  Created by Nadia Vedeneyeva on 5/7/21.
//

import UIKit
import CoreData

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tField : UITextField!
    
    var items : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let context = UIApplication.shared.delegate as! AppDelegate
        let contextObject = context.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        var results : [AnyObject]?
        
        do {
            results = try contextObject.fetch(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.items = results as! [Item]
        }
        
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = self.items[indexPath.row]
        cell.textLabel!.text = item.title
        return cell
    }


    @IBAction func addButtonPressed(_ sender: Any) {
        alertPopup()
    }
    
    func configurationTextField(textField: UITextField) {
        textField.placeholder = "Enter New Item"
        self.tField = textField
    }
    
    func saveNewItem() {
        let context = UIApplication.shared.delegate as! AppDelegate
        let contextObject = context.persistentContainer.viewContext
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: contextObject) as! Item
        
        item.title = tField.text
        do {
            try contextObject.save()
        } catch _ {
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        var results : [AnyObject]?
        
        do {
            results = try contextObject.fetch(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.items = results as! [Item]
        }
        
        self.tableView.reloadData()
    }
    
    func alertPopup() {
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            alert.dismiss(animated: true, completion: nil)
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default) {
            UIAlertAction in self.saveNewItem()
        }
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

