//
//  CustomButton.swift
//  DiceGame
//
//  Created by Ashwini shalke on 25/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        setUpButton()
        
    }
    
    func setUpButton() {
        backgroundColor     = UIColor(red: 150/255, green: 30/255, blue: 31/255, alpha: 1)
        titleLabel?.font    = UIFont(name: "georgia", size: 20)
        setTitleColor(.white, for: .normal)
        layer.borderColor   = UIColor.gray.cgColor
        layer.cornerRadius  = 25
        layer.borderWidth   = 4.0
        styleShadow()
        
    }
    
    
  private  func styleShadow(){
        layer.shadowColor   = UIColor.white.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 10
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
    func shakeAnimation() {
        let shake               = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.timingFunction    = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        shake.duration          = 0.5
        shake.values            = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(shake, forKey: "shake")
        
    }
    
    func flashAnimation(){
        let flash               = CABasicAnimation(keyPath: "opacity")
        flash.duration          = 0.5
        flash.fromValue         = 1
        flash.toValue           = 0.1
        flash.repeatCount       = 1000
        flash.autoreverses      = true
        flash.timingFunction    = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(flash, forKey: nil)
        
    }
    
    func pulseAnimation(){
        let pulse               = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue         = 0.95
        pulse.toValue           = 1.0
        pulse.duration          = 0.5
        pulse.initialVelocity   = 2
        pulse.damping           = 1.0
        pulse.autoreverses      = true
        layer.add(pulse, forKey: nil)
    }
    
}
