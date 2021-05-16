//
//  ViewController.swift
//  Wishlist
//
//  Created by Nadia Vedeneyeva on 5/13/21.
//

import UIKit
import CoreData

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
    var selectedProduct : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        let context = UIApplication.shared.delegate as! AppDelegate
        let contextObject = context.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")

        let results : [AnyObject]?

        do {
            results = try contextObject.fetch(request)
        }catch _{
            results = nil
        }

        if results != nil {
            self.products = results! as! [Product]
        }

        self.tableView.reloadData()

        print("PASS")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedProduct = self.products[indexPath.row]
        self.performSegue(withIdentifier: "tableViewToDetailSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableViewToDetailSegue" {
            let detailVC = segue.destination as! ProductDetailViewController
            detailVC.product = self.selectedProduct
        }
    }
}

