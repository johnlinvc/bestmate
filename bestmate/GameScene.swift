//
//  GameScene.swift
//  bestmate
//
//  Created by Yu-Hsiang Lin on 7/12/16.
//  Copyright (c) 2016 jlvc. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var blocks:[SKLabelNode]? = nil
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let cards = (1...12).map { return String($0) }
        let names = cards + cards
        let shuffledNames = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(names).map{ $0 as! String }
        blocks = shuffledNames.map {
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
    
    var toggledBlock:SKLabelNode? {
        didSet {
            markSelected(toggledBlock)
            markUnSelected(oldValue)
        }
    }
    
    func markSelected(block: SKLabelNode?){
        guard let b = block else { return }
        b.fontColor = UIColor.redColor()
    }
    
    func markUnSelected(block: SKLabelNode?) {
        guard let b = block else { return }
        b.fontColor = UIColor.blackColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.locationInNode(self)
        let idx = blocks?.indexOf{
            return $0.containsPoint(location)
        }
        guard let iidx = idx else { return }
        guard let block = blocks?[iidx] else { return }
        guard let lastBlock = toggledBlock else {
            toggledBlock = block
            return
        }
        toggledBlock = nil
        guard lastBlock != block else { return }
        if lastBlock.text == block.text {
            markCompleted(lastBlock)
            markCompleted(block)
        }
    }
    
    func markCompleted(block: SKLabelNode){
        block.fontColor = UIColor.greenColor()
    }
   
}
