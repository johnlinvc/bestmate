//
//  CardNode.swift
//  bestmate
//
//  Created by Yu-Hsiang Lin on 7/12/16.
//  Copyright © 2016 jlvc. All rights reserved.
//

import SpriteKit

enum CardNodeState {
    case Normal
    case Selected
    case Finished
    case Pink
}

class CardNode: SKNode {
    required init?(coder aDecoder: NSCoder) {
        label = SKLabelNode(fontNamed: "helvetica")
        label.fontColor = normalColor
        background = SKShapeNode(rectOfSize: CGSize(width: length, height: length), cornerRadius: cornerRadius)
        state = .Normal
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
        label.fontColor = normalColor
        background = SKShapeNode(rectOfSize: CGSize(width: length, height: length), cornerRadius: cornerRadius)
        state = .Normal
        super.init()
        label.position = CGPoint(x: 0,y: -15)
        label.fontSize = 45
        background.position = CGPoint(x: 0,y: 0)
        background.fillColor = UIColor.whiteColor()
        background.strokeColor = UIColor.blueColor()
        background.zPosition = fgZPos
        self.addChild(label)
        self.addChild(background)
    }
    
    let normalColor = UIColor.blackColor()
    let fgZPos:CGFloat = 100
    let bgZpos:CGFloat = -1
    
    var state:CardNodeState {
        didSet {
            switch state {
            case .Normal:
                label.fontColor = normalColor
                background.zPosition = fgZPos
            case .Selected:
                background.zPosition = bgZpos
            case .Finished:
                background.zPosition = bgZpos
                label.fontColor = UIColor.greenColor()
            case .Pink:
                background.zPosition = bgZpos
            }
        }
    }
    
    func setToPink(){
        label.fontColor = UIColor(colorLiteralRed: 219.0/255.0, green: 112.0/255.0, blue: 147.0/255.0, alpha: 1)
    }
    
    var text:String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
}
