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
        backgroundColor     = UIColor.red
        titleLabel?.font    = UIFont(name: "Georgia Bold 20.0", size: 20)
        setTitleColor(.white, for: .normal)
        layer.borderColor   = UIColor.white.cgColor
        layer.cornerRadius  = 25
        layer.borderWidth   = 3.0
        layer.borderColor   = UIColor.white.cgColor
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
    
    
    func shakeButton() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 6, y: center.y)
        let fromValue       = NSValue(cgPoint : fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 6, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake , forKey: "position")
    }
    
    
    func flashButton(){
        let flash               = CABasicAnimation(keyPath: "opacity")
        flash.duration          = 0.5
        flash.fromValue         = 1
        flash.toValue           = 0.1
        flash.repeatCount       = 1000
        flash.autoreverses      = true
        flash.timingFunction    = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(flash, forKey: nil)
        
    }
    
    func pulseButton(){
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
