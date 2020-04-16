//
//  GameScene.swift
//  snake
//
//  Created by Александр Десятчиков on 16/04/2020.
//  Copyright © 2020 AlDes. All rights reserved.
//

import SpriteKit;
import GameplayKit;

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0;
    static let SnakeHead: UInt32 = 0x1 << 1;
    static let Apple: UInt32 = 0x1 << 2;
    static let EdgeBody: UInt32 = 0x1 << 3;
};

class GameScene: SKScene {
    
    var snake: Snake?;
    
    override func didMove(to view: SKView) {
        
        
        backgroundColor = SKColor.black;
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0);
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame);
        self.physicsBody?.allowsRotation = false;
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody;
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead;
        self.physicsWorld.contactDelegate = self;
        view.showsPhysics = true;
        
        
        let counterClockwiseButton = SKShapeNode();
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath;
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30);
        counterClockwiseButton.fillColor = UIColor.gray;
        counterClockwiseButton.strokeColor = UIColor.gray;
        counterClockwiseButton.name = "counterClockwiseButton";
        self.addChild(counterClockwiseButton);
        
        let clockwiseButton = SKShapeNode();
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath;
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30);
        clockwiseButton.fillColor = UIColor.gray;
        clockwiseButton.strokeColor = UIColor.gray;
        clockwiseButton.name = "clockwiseButton";
        self.addChild(clockwiseButton);
        
        createApple();
        
      
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY));
        self.addChild(snake!);
        
    };
    
    func createApple(){
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)) + 1);
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)) + 1);
        
        let apple = Apple(position: CGPoint(x: randX, y: randY));
        self.addChild(apple);
    };
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self);
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode, touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                return;
            };
            
            touchedNode.fillColor = .green;
            
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise();
            } else if touchedNode.name == "clockwiseButton"{
                snake!.moveClockwise();
            };
            
            
        };
    };
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self);
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode, touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                return;
            };
            
            touchedNode.fillColor = .gray;
        };
    };
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    };
    
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    };
};

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact){
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask;
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead;
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node;
            snake?.addBodyPart();
            apple?.removeFromParent();
            createApple();
            
            // Домашнее задание: рестарт в случае столкновения со стеной
            // столкновение со стеной
        case CollisionCategories.EdgeBody:
            // удаляем
            self.removeAllChildren();
            // начинаем заново
            didMove(to: view!);

            break;
        
        default:
            break;
        };
    };
};
