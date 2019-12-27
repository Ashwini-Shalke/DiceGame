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
    let cube = CATransformLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImage(named:  "GreenBackground")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)

        setUpStartButton()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      
       
        
        super.viewDidAppear(true)

            view.backgroundColor = .black
             let cube = CATransformLayer()
           
            let anim = CABasicAnimation(keyPath: "transform")
            anim.fromValue = cube.transform
            anim.toValue = CATransform3DMakeRotation(CGFloat.pi, 1, 1, 1)
            anim.duration = 2
            anim.isCumulative = true
            anim.repeatCount = .greatestFiniteMagnitude
            cube.add(anim, forKey: "transform")
        
        
            // create the front face
            let transform1 = CATransform3DMakeTranslation(0, 0, 50)
            cube.addSublayer(face(with: transform1, image: "DiceOne"))

            // create the right-hand face
            var transform2 = CATransform3DMakeTranslation(50, 0, 0)
            transform2 = CATransform3DRotate(transform2, CGFloat.pi / 2, 0, 1, 0)
            cube.addSublayer(face(with: transform2, image: "DiceTwo"))

            // create the top face
            var transform3 = CATransform3DMakeTranslation(0, -50, 0)
            transform3 = CATransform3DRotate(transform3, CGFloat.pi / 2, 1, 0, 0)
            cube.addSublayer(face(with: transform3, image: "DiceThree"))

            // create the bottom face
            var transform4 = CATransform3DMakeTranslation(0, 50, 0)
            transform4 = CATransform3DRotate(transform4, -(CGFloat.pi / 2), 1, 0, 0)
            cube.addSublayer(face(with: transform4, image: "DiceFour"))

            // create the left-hand face
            var transform5 = CATransform3DMakeTranslation(-50, 0, 0)
            transform5 = CATransform3DRotate(transform5, -(CGFloat.pi / 2), 0, 1, 0)
            cube.addSublayer(face(with: transform5, image: "DiceFive"))

            // create the back face
            var transform6 = CATransform3DMakeTranslation(0, 0, -50)
            transform6 = CATransform3DRotate(transform6, CGFloat.pi, 0, 1, 0)
            cube.addSublayer(face(with: transform6, image: "DiceSix"))

            // now position the transform layer in the center
            cube.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    
            // and add the cube to our main view's layer
            view.layer.addSublayer(cube)

    }
    
    
    func face(with transform: CATransform3D, image : String) -> CALayer {
        let face = CALayer()
        let myImage = UIImage(named: image)?.cgImage
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        face.contents = myImage
//        face.backgroundColor = color.cgColor
        face.transform = transform
        return face
    }
   
    
    
    func setUpStartButton(){
        view.addSubview(startButton)
        startButton.setTitle("START", for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 400),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 60)])
        startButton.flashAnimation()
        startButton.addTarget(self, action:#selector(stopButtonAction) , for: .allTouchEvents)
    }
    
    
    @objc func stopButtonAction(){
        startButton.layer.removeAllAnimations()
       
    }
    

}
