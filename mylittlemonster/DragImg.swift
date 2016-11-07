//
//  DragImg.swift
//  mylittlemonster
//
//  Created by Brian Bresen on 11/5/16.
//  Copyright © 2016 BeeHive Productions. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget {
            let position = touch.location(in: self.superview)
            
            // if we rotate we have the wrong target frame for some reason
           print("\(target.bounds)")
            print("pos: \(position)")
            print("\(target.frame)")
            
            // swift 2 way - if CGRectContainsPoint(target.frame,position) {
            
            if target.frame.contains(position) {
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "onTargetDropped"), object: nil)
            }
        }
            
        self.center = originalPosition
    }
    
}
