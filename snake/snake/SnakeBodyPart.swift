//
//  SnakeBodyPart.swift
//  snake
//
//  Created by Александр Десятчиков on 16/04/2020.
//  Copyright © 2020 AlDes. All rights reserved.
//

import UIKit;
import SpriteKit;

class SnakeBodyPart: SKShapeNode {
    
    let diameter = 10.0;
    
    init(atPoint point: CGPoint) {
        super.init();
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diameter), height: CGFloat(diameter))).cgPath;
        fillColor = UIColor.green;
        strokeColor = UIColor.green;
        lineWidth = 5;
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter - 4), center: CGPoint(x: 5, y: 5));
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake;
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple;
        self.position = point;
    };
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    };
};
