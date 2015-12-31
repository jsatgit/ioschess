//
//  GameScene.m
//  ioschess
//
//  Created by James Shi on 2015-12-27.
//  Copyright (c) 2015 James Shi. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)createBoard:(CGPoint)position withSize:(CGSize)size {
    SKShapeNode* board = [SKShapeNode shapeNodeWithRectOfSize:size];
    board.position = position;
    board.lineWidth = 0;
    
    
    CGFloat cellWidth = size.width/8;
    CGFloat cellOffset = size.width/2 - cellWidth/2;
    SKColor* lightColor = [[UIColor alloc] initWithRed: 255/255.0 green: 206/255.0 blue: 158/255.0 alpha: 1];
    SKColor* darkColor = [[UIColor alloc] initWithRed: 209/255.0 green: 139/255.0 blue: 71/255.0 alpha: 1];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            BOOL bothEven = i % 2 == 0 && j % 2 == 0;
            BOOL bothOdd = i % 2 != 0 && j % 2 != 0;
            SKShapeNode* cell = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(cellWidth, cellWidth)];
            cell.position = CGPointMake(i * cellWidth - cellOffset, j * cellWidth - cellOffset);
            cell.fillColor = bothEven || bothOdd ? darkColor : lightColor;
            cell.lineWidth = 0;
            [board addChild:cell];
        }
    }
    [self addChild:board];
}

-(void)createSceneContents {
    self.backgroundColor = [SKColor darkGrayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    [self createBoard:CGPointMake(screenWidth/2, screenHeight/2) withSize:CGSizeMake(screenWidth, screenWidth)];
}

-(void)didMoveToView:(SKView *)view {
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
