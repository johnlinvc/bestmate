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
    
    var blocks:[CardNode]? = nil
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = UIColor.whiteColor()
        let cards = (1...12).map { return String($0) }
        let names = cards + cards
        let shuffledNames = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(names).map{ $0 as! String }
        blocks = shuffledNames.map {
            let node = CardNode()
            node.text = $0
            return node
        }
        let width:CGFloat = blocks![0].length + 5
        for (idx,b) in blocks!.enumerate() {
            let xIdx = (idx % 5) - 2
            let yIdx = 2 - (idx / 5)
            let x:CGFloat = CGRectGetMidX(self.frame) + width * CGFloat(xIdx)
            let y:CGFloat = CGRectGetMidY(self.frame) + width * CGFloat(yIdx)
            b.position = CGPoint(x: x, y: y)
            addChild(b)
        }
    }
    
    var toggledBlock:CardNode? {
        didSet {
            toggledBlock?.state = CardNodeState.Selected
            oldValue?.state = CardNodeState.Normal
        }
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
            lastBlock.state = CardNodeState.Finished
            block.state = CardNodeState.Finished
        }
    }
    
}
