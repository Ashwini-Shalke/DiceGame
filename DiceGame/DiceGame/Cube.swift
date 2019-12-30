//
//  3DCube.swift
//  DiceGame
//
//  Created by Ashwini shalke on 30/12/19.
//  Copyright © 2019 Ashwini Shalke. All rights reserved.
//

import UIKit

class Cube: CATransformLayer {
    
    func transformAnimation(){
        let anim            = CABasicAnimation(keyPath: "transform")
        anim.fromValue      = self.transform
        anim.toValue        = CATransform3DMakeRotation(CGFloat.pi, 1, 1, 1)
        anim.duration       = 2
        anim.isCumulative   = true
        anim.repeatCount    = .greatestFiniteMagnitude
        add(anim, forKey: nil)
    }
    
  
    
    
    func face(with transform: CATransform3D, image : String) -> CALayer {
        let face          = CALayer()
        face.frame        = CGRect(x: -50, y: -50, width: 100, height: 100)
        let image         = UIImage(named: image)?.cgImage
        face.contents     = image
        face.transform    = transform
        return face
    }
    
}
