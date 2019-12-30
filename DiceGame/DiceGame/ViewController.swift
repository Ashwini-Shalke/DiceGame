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
    let stopButton = CustomButton()
    let cube = Cube()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage(named: "GreenBackground")?.cgImage
        setUpStartButton()
        constructCube()
    }
    
    
    
    func constructCube(){
       
        //create front face
        let transform1 = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(cube.face(with: transform1, image: "DiceOne"))

        // create the right-hand face
        var transform2 = CATransform3DMakeTranslation(50, 0, 0)
        transform2 = CATransform3DRotate(transform2, CGFloat.pi / 2, 0, 1, 0)
        cube.addSublayer(cube.face(with: transform2, image: "DiceTwo"))

        // create the top face
        var transform3 = CATransform3DMakeTranslation(0, -50, 0)
        transform3 = CATransform3DRotate(transform3, CGFloat.pi / 2, 1, 0, 0)
        cube.addSublayer(cube.face(with: transform3, image: "DiceThree"))
        
        // create the bottom face
        var transform4 = CATransform3DMakeTranslation(0, 50, 0)
        transform4 = CATransform3DRotate(transform4, -(CGFloat.pi / 2), 1, 0, 0)
        cube.addSublayer(cube.face(with: transform4, image: "DiceFour"))

        // create the left-hand face
        var transform5 = CATransform3DMakeTranslation(-50, 0, 0)
        transform5 = CATransform3DRotate(transform5, -(CGFloat.pi / 2), 0, 1, 0)
        cube.addSublayer(cube.face(with: transform5, image: "DiceFive"))

        // create the back face
        var transform6 = CATransform3DMakeTranslation(0, 0, -50)
        transform6 = CATransform3DRotate(transform6, CGFloat.pi, 0, 1, 0)
        cube.addSublayer(cube.face(with: transform6, image: "DiceSix"))

        // now position the transform layer in the center
        cube.position = CGPoint(x: view.bounds.midX , y: view.bounds.midY)

        // and add the cube to our main view's layer
        
        view.layer.backgroundColor = UIColor(patternImage: UIImage(named: "GreenBackground")!).cgColor
        
        view.layer.addSublayer(cube)
    }
    
    func setUpStartButton(){
        stopButton.removeFromSuperview()
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 300),
        startButton.widthAnchor.constraint(equalToConstant: 200),
        startButton.heightAnchor.constraint(equalToConstant: 60)])
        startButton.setTitle("START", for: .normal)
        
        startButton.flashAnimation()
        startButton.addTarget(self, action:#selector(startRotation) , for: .allTouchEvents)
    }

       

    @objc func startRotation(){
        cube.transformAnimation()
        setStopButton()
    }
     
    
    func setStopButton(){
        startButton.removeFromSuperview()
        view.addSubview(stopButton)
        stopButton.setTitle("STOP", for: .normal)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        stopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        stopButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 300),
        stopButton.widthAnchor.constraint(equalToConstant: 200),
        stopButton.heightAnchor.constraint(equalToConstant: 60)])
        stopButton.pulseAnimation()
        stopButton.addTarget(self, action:#selector(stopRotation) , for: .allTouchEvents)
    }
    
    @objc func stopRotation(){
        
        cube.removeAllAnimations()
        setUpStartButton()
        
        
    }
}
