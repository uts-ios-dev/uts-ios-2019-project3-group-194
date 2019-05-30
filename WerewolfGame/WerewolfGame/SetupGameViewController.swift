//
//  SetupGameViewController.swift
//  WerewolfGame
//
//  Created by Anzi Wu on 27/5/19.
//  Copyright © 2019 King. All rights reserved.
//

import Foundation
import UIKit

class SetupGameViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

////////Set Total Player/////////
    @IBOutlet weak var NumberOfPlayer: UILabel!
    
    @IBAction func SetNumberOfPlayer(_ sender: UIStepper)
    {
        NumberOfPlayer.text = Int(sender.value).description;
    }
    
/////////Set Wolf Number/////////
    @IBOutlet weak var WolfNumber: UILabel!
    
    @IBAction func SetNumberOfWolf(_ sender: UIStepper) {
        WolfNumber.text = Int(sender.value).description;
    }
    
    
////////Set Villagers Number//////////
    @IBOutlet weak var VillagerNumber: UILabel!
    @IBAction func SetNumberOfVillager(_ sender: UIStepper)
    {
        VillagerNumber.text = Int(sender.value).description;
    }
    
}
