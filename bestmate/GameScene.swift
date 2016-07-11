//
//  GameScene.swift
//  bestmate
//
//  Created by Yu-Hsiang Lin on 7/12/16.
//  Copyright (c) 2016 jlvc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var blocks:[SKLabelNode]? = nil
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let names = (1...25).map {
            return String($0)
        }
        blocks = names.map {
            return SKLabelNode(text: $0)
        }
        let width:CGFloat = 90
        for b in blocks! {
            b.fontName = "helvetica"
            b.fontSize = width/2
            b.fontColor = UIColor.blackColor()
        }
        for (idx,b) in blocks!.enumerate() {
            let xIdx = (idx % 5) - 2
            let yIdx = 2 - (idx / 5)
            let x:CGFloat = CGRectGetMidX(self.frame) + width * CGFloat(xIdx)
            let y:CGFloat = CGRectGetMidY(self.frame) + width * CGFloat(yIdx)
            b.position = CGPoint(x: x, y: y)
            addChild(b)
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let idx = blocks?.indexOf{
                return $0.containsPoint(location)
            }
            guard let iidx = idx else { continue }
            let block = blocks?[iidx]
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
