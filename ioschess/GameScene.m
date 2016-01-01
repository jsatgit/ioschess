//
//  GameScene.m
//  ioschess
//
//  Created by James Shi on 2015-12-27.
//  Copyright (c) 2015 James Shi. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(SKSpriteNode*)createPiece:(NSString*)name withPosition:(CGPoint)position {
    SKTextureAtlas* pieces = [SKTextureAtlas atlasNamed: @"pieces"];
    SKTexture* pieceTexture = [pieces textureNamed:name];
    SKSpriteNode* piece = [SKSpriteNode spriteNodeWithTexture:pieceTexture size:CGSizeMake(self.cellWidth, self.cellWidth)];
    CGFloat cellOffset = self.boardWidth/2 - self.cellWidth/2;
    piece.position = CGPointMake(position.x * self.cellWidth - cellOffset, position.y * self.cellWidth - cellOffset);
    piece.name = @"piece";
    return piece;
}

-(void)snapToPosition:(SKNode*)piece withPosition:(CGPoint)position {
    CGFloat cellIndexX = position.x/self.cellWidth;
    CGFloat cellIndexY = position.y/self.cellWidth;
    int roundedX = floor(cellIndexX);
    int roundedY = floor(cellIndexY);
    CGFloat halfBoardWidth = self.boardWidth/2;
    CGFloat halfCellWidth = self.cellWidth/2;
    CGFloat nearestX = roundedX * self.cellWidth + halfCellWidth;
    CGFloat nearestY = roundedY * self.cellWidth + halfCellWidth;
    if (nearestX < -halfBoardWidth) {
        nearestX = -halfBoardWidth + halfCellWidth;
    } else if (nearestX >= halfBoardWidth) {
        nearestX = halfBoardWidth - halfCellWidth;
    }
    
    if (nearestY < -halfBoardWidth) {
        nearestY = -halfBoardWidth + halfCellWidth;
    } else if (nearestY >= halfBoardWidth) {
        nearestY = halfBoardWidth - halfCellWidth;
    }
    piece.position = CGPointMake(nearestX, nearestY);
}

-(SKShapeNode*)createBoard:(CGPoint)position {
    SKShapeNode* board = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.boardWidth, self.boardWidth)];
    board.position = position;
    board.lineWidth = 0;
    
    
    CGFloat cellOffset = self.boardWidth/2 - self.cellWidth/2;
    SKColor* lightColor = [[UIColor alloc] initWithRed: 255/255.0 green: 206/255.0 blue: 158/255.0 alpha: 1];
    SKColor* darkColor = [[UIColor alloc] initWithRed: 209/255.0 green: 139/255.0 blue: 71/255.0 alpha: 1];
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            BOOL bothEven = i % 2 == 0 && j % 2 == 0;
            BOOL bothOdd = i % 2 != 0 && j % 2 != 0;
            SKShapeNode* cell = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.cellWidth, self.cellWidth)];
            cell.position = CGPointMake(i * self.cellWidth - cellOffset, j * self.cellWidth - cellOffset);
            cell.fillColor = bothEven || bothOdd ? darkColor : lightColor;
            cell.lineWidth = 0;
            [board addChild:cell];
        }
    }
    return board;
}

-(void)createSceneContents {
    self.backgroundColor = [SKColor darkGrayColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    self.boardWidth = screenWidth;
    self.cellWidth = self.boardWidth/8;
    SKShapeNode* board = [self createBoard:CGPointMake(screenWidth/2, screenHeight/2)];
    self.board = board;
    [board addChild:[self createPiece:@"blackRook" withPosition:CGPointMake(0, 0)]];
    [board addChild:[self createPiece:@"blackKnight" withPosition:CGPointMake(1, 0)]];
    [board addChild:[self createPiece:@"blackBishop" withPosition:CGPointMake(2, 0)]];
    [board addChild:[self createPiece:@"blackKing" withPosition:CGPointMake(3, 0)]];
    [board addChild:[self createPiece:@"blackQueen" withPosition:CGPointMake(4, 0)]];
    [board addChild:[self createPiece:@"blackBishop" withPosition:CGPointMake(5, 0)]];
    [board addChild:[self createPiece:@"blackKnight" withPosition:CGPointMake(6, 0)]];
    [board addChild:[self createPiece:@"blackRook" withPosition:CGPointMake(7, 0)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(0, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(1, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(2, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(3, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(4, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(5, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(6, 1)]];
    [board addChild:[self createPiece:@"blackPawn" withPosition:CGPointMake(7, 1)]];
    
    [board addChild:[self createPiece:@"whiteRook" withPosition:CGPointMake(0, 7)]];
    [board addChild:[self createPiece:@"whiteKnight" withPosition:CGPointMake(1, 7)]];
    [board addChild:[self createPiece:@"whiteBishop" withPosition:CGPointMake(2, 7)]];
    [board addChild:[self createPiece:@"whiteKing" withPosition:CGPointMake(3, 7)]];
    [board addChild:[self createPiece:@"whiteQueen" withPosition:CGPointMake(4, 7)]];
    [board addChild:[self createPiece:@"whiteBishop" withPosition:CGPointMake(5, 7)]];
    [board addChild:[self createPiece:@"whiteKnight" withPosition:CGPointMake(6, 7)]];
    [board addChild:[self createPiece:@"whiteRook" withPosition:CGPointMake(7, 7)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(0, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(1, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(2, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(3, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(4, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(5, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(6, 6)]];
    [board addChild:[self createPiece:@"whitePawn" withPosition:CGPointMake(7, 6)]];
    [self addChild:board];
    
}

-(void)didMoveToView:(SKView *)view {
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint position = [touch locationInNode:self];
        SKNode* node = [self nodeAtPoint:position];
        if (self.selectedNode != node) {
            self.selectedNode = node;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        if (self.selectedNode && [self.selectedNode.name isEqualToString:@"piece"]) {
            CGPoint position = [touch locationInNode: self.board];
            self.selectedNode.position = position;
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        if (self.selectedNode && [self.selectedNode.name isEqualToString:@"piece"]) {
            CGPoint position = [touch locationInNode: self.board];
            [self snapToPosition:self.selectedNode withPosition:position];
        }
    }
    self.selectedNode = NULL;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
