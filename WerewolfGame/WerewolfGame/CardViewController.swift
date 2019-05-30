//
//  CardViewController.swift
//  WerewolfGame
//
//  Created by 刘子铭 on 2019/5/22.
//  Copyright © 2019 King. All rights reserved.
//

import UIKit

class CardViewController: UIViewController
{
    let backgroundImageView = UIImageView()
    var isOpen = false
    @IBOutlet weak var roleName: UILabel!
    @IBOutlet weak var roleDetail: UITextView!
    @IBOutlet weak var card: UIButton!
    var flipAnimationDuration = 0.1
    var timer: Timer!
    let transition = CATransition()
    var stopFlip = false
    let image = UIImage(named: "cardBack")
    let roleList = ["witch", "savior", "villagers", "seer", "werewolf"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func addCard()
    {

    }

    @IBAction func flipCard(_ sender: Any)
    {

        if stopFlip == false
        {
            startTimer()
            flipOnce()
        }
        else
        {
            resetTimer()
            flipOnce()
            
        }
        //performSegue(withIdentifier: "toSelfieView", sender: flipCard)
    }
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(slowDown), userInfo: nil, repeats: true)
    }
    func resetTimer()
    {
        timer.invalidate()
        flipAnimationDuration = 0.1
        stopFlip = false
        startTimer()
        
    }
    func flipOnce()
    {

        card.setImage(image, for: .normal)
        UIView.transition(with: card, duration: flipAnimationDuration, options: [.transitionFlipFromLeft], animations: nil, completion:
            {(finished: Bool) in
                self.flipTwice()})


    }
    func flipTwice()
    {
        if stopFlip == false
        {
            let randomIndex = arc4random() % UInt32(roleList.count)
            let named = roleList[Int(randomIndex)]
            let image = UIImage(named: named)
            card.setImage(image, for: .normal)
            UIView.transition(with: card, duration: flipAnimationDuration, options: [.transitionFlipFromLeft], animations: nil, completion: {(finished: Bool) in
                self.flipOnce()})
            
        }
        else
        {
            let randomIndex = arc4random() % 3
            let named = roleList[Int(randomIndex)]
            let image = UIImage(named: named)
            card.setImage(image, for: .normal)
            UIView.transition(with: card, duration: flipAnimationDuration, options: [.transitionFlipFromLeft], animations: nil, completion:
                {(finished: Bool) in self.setDetails(named: named)
                    })
            
        }
        
    }
    @objc func slowDown()
    {
        flipAnimationDuration *= 1.8
        if flipAnimationDuration >= 0.6
        {

            stopFlip = true
        }
    }
    
    func setDetails(named: String)
    {
        self.roleName.text = named
        switch named
        {
            case "witch":
            roleDetail.text = "This role, while first and foremost taking on all the elements of a regular Villager throughout the game, also has the additional powers of one potion and one poison, which they may use at any point throughout the game. When the Witch is added, the Moderator will wake them up separately during the night with, “The Witch comes awake…” and follows this with “The Witch brings someone back to life.” and “The Witch poisons someone.” The Witch will then point to the person they want to poison or bring back to life. While the Witch can only use their potion and poison once, each action must be said each night to retain anonymity as to what has been done. They can only use one per evening until both are gone, and have the ability to save them until a point in the game they deem fit."
            case "villagers":
            roleDetail.text = "The most commonplace role, a simple Villager, spends the game trying to root out who they believe the werewolves (and other villagers) are. While they do not need to lie, the role requires players to keenly sense and point out the flaws or mistakes of their fellow players. Someone is speaking too much? Could mean they're a werewolf. Someone isn't speaking enough? Could mean the same thing. It all depends on the people you're playing with, and how well you know them."
            
        default:
            print("Switch error")
        }
    
        
    }
}


