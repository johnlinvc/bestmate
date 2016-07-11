//
//  CardNode.swift
//  bestmate
//
//  Created by Yu-Hsiang Lin on 7/12/16.
//  Copyright © 2016 jlvc. All rights reserved.
//

import SpriteKit

class CardNode: SKNode {
    required init?(coder aDecoder: NSCoder) {
        label = SKLabelNode(fontNamed: "helvetica")
        background = SKShapeNode(rectOfSize: CGSize(width: length, height: length), cornerRadius: cornerRadius)
        super.init(coder: aDecoder)
        label.position = CGPoint(x: 0,y: 0)
        background.position = CGPoint(x: 0,y: 0)
        self.addChild(label)
        self.addChild(background)
    }
    var label:SKLabelNode
    var background:SKShapeNode
    let length:CGFloat = 90
    let cornerRadius:CGFloat = 10
    override init() {
        label = SKLabelNode(fontNamed: "helvetica")
        background = SKShapeNode(rectOfSize: CGSize(width: length, height: length), cornerRadius: cornerRadius)
        super.init()
        label.position = CGPoint(x: 0,y: 0)
        label.fontSize = 45
        background.position = CGPoint(x: 0,y: 0)
        self.addChild(label)
        self.addChild(background)
    }
    
    var text:String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    var fontColor:UIColor?{
        get { return label.fontColor }
        set { label.fontColor = newValue }
    }
}
