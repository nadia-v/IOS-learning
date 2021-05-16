//
//  ColorViewController.swift
//  Colorific
//
//  Created by Nadia Vedeneyeva on 4/29/21.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.view.backgroundColor == UIColor.red {
            self.colorLabel.text = "RED!"
        }else if self.view.backgroundColor == UIColor.blue {
            self.colorLabel.text = "BLUE!"
        }else if self.view.backgroundColor == UIColor.green {
            self.colorLabel.text = "GREEN!"
        }else if self.view.backgroundColor == UIColor.purple {
            self.colorLabel.text = "PURPLE!"
        }else if self.view.backgroundColor == UIColor(displayP3Red: 225/225, green: 0/225, blue: 128/225, alpha: 1.0) {
            self.colorLabel.text = "PINK!"
        }else if self.view.backgroundColor == UIColor.yellow {
            self.colorLabel.text = "YELLOW!"
        }
    }
}
