//
//  ViewController.swift
//  WerewolfGame
//
//  Created by 刘子铭 on 2019/5/18.
//  Copyright © 2019 King. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    
    @IBOutlet weak var singleDeviceButton: UIButton!
    

    @IBAction func singleDeviceModeBtnTouched(_ sender: Any)
    {
        self.performSegue(withIdentifier: "toDealCardView", sender: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
}

