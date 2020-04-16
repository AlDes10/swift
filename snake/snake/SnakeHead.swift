//
//  SnakeHead.swift
//  snake
//
//  Created by Александр Десятчиков on 16/04/2020.
//  Copyright © 2020 AlDes. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart {

    override init(atPoint point: CGPoint) {
        super.init(atPoint: point);
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead;
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake;
    };
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    };
};
