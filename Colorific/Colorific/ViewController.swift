//
//  ViewController.swift
//  Colorific
//
//  Created by Nadia Vedeneyeva on 4/27/21.
//

import UIKit

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedColor : UIColor?
    
    let colors : [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.purple, UIColor(displayP3Red: 225/225, green: 0/225, blue: 128/225, alpha: 1.0), UIColor.yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = self.colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedColor = self.colors[indexPath.row]
        
        self.performSegue(withIdentifier: "toColorScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toColorScreen" {
            segue.destination.view.backgroundColor = self.selectedColor
        }
    }
}

