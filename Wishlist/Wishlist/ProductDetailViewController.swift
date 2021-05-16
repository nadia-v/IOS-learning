//
//  ProductDetailViewController.swift
//  Wishlist
//
//  Created by Nadia Vedeneyeva on 5/13/21.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.product!.title
        self.storeLabel.text = self.product!.store
        self.imageView.image = UIImage(data: self.product!.image!)
    }
    


}
