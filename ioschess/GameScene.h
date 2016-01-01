//
//  GameScene.h
//  ioschess
//

//  Copyright (c) 2015 James Shi. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

@property BOOL contentCreated;
@property CGFloat boardWidth;
@property CGFloat cellWidth;
@property SKNode* selectedNode;
@property SKShapeNode* board;

@end
