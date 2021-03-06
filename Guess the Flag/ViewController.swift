//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Artyom Nesterenko on 14/2/20.
//  Copyright © 2020 artnest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var button1: UIButton!
    @IBOutlet private var button2: UIButton!
    @IBOutlet private var button3: UIButton!
    
    private var countries = [
        "estonia",
        "france",
        "germany",
        "ireland",
        "italy",
        "monaco",
        "nigeria",
        "poland",
        "russia",
        "spain",
        "uk",
        "us"
    ]
    private var correctAnswer = 0
    private var score = 0
    private var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    private func askQuestion(action: UIAlertAction! = nil) {
        if questionsAsked == 10 {
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            
            let ac = UIAlertController(title: "Game Finish", message: "Your final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Finish", style: .default))
            present(ac, animated: true)
            return
        }
        
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        questionsAsked += 1
        title = "\(countries[correctAnswer].uppercased()), Score: \(score)"
    }
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        let title: String
        let message: String
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
            message = "Your score is \(score)."
        } else {
            score -= 1
            title = "Wrong"
            let country = countries[sender.tag].capitalized
            message = "That's the flag of \(country)"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}
