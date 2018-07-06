//
//  GameScene.swift
//  Car_game2
//
//  Created by Anthony Dinh on 7/5/18.
//  Copyright © 2018 Anthony Dinh. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var car = SKSpriteNode()
    
    override func didMove(to view: SKView) {

        createLane()
    }
    
    func createLane() {
        let laneTexture = SKTexture(imageNamed: "bowlinglane_png")
        
        for i in 0...1 {
            let lanePic = SKSpriteNode(texture: laneTexture)
            lanePic.zPosition = -30 // sets in front of the blue bg
            lanePic.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            lanePic.position = CGPoint(x: 100, y: (laneTexture.size().height * CGFloat(i)) - CGFloat(3 * i))
            
            addChild(lanePic)
            
            let moveUp = SKAction.moveBy(x: 0, y: -laneTexture.size().height, duration: 3)
            let moveReset = SKAction.moveBy(x: 0, y: laneTexture.size().height, duration: 0)
            let moveLoop = SKAction.sequence([moveUp, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            
            lanePic.run(moveForever)
        }
    }
    
}
