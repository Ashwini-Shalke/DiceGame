//
//  ViewController.swift
//  DiceGame
//
//  Created by Ashwini shalke on 25/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let startButton = CustomButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "GreenBackground")!)
        setUpStartButton()
    }
    
    
    func setUpStartButton(){
        view.addSubview(startButton)
        startButton.setTitle("START", for: .normal)
        startButtonLayout()
        startButton.flashButton()
        startButton.addTarget(self, action:#selector(stopButtonAction) , for: .allTouchEvents)
    }
    
    
    func startButtonLayout(){
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 60)])
    
    }
    
    
    @objc func stopButtonAction(){
        startButton.layer.removeAllAnimations()
    }
    

}
