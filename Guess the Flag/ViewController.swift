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
    
    private var countries = [String]()
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
}
