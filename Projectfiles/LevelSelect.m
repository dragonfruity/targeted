//
//  LevelSelect.m
//  bullet hell-o
//
//  Created by Kevin Frans on 7/3/13.
//
//

#import "LevelSelect.h"
#import "HelloWorldLayer.h"
#import "Title.h"
#import "Scene.h"
//#import "Level2.h"

@implementation LevelSelect

-(id) init
{
    if ((self = [super init]))
    {
        CGSize screen = [[CCDirector sharedDirector] screenSize];
        if(screen.height == 1136)
        {
        glClearColor(255, 255, 255, 255);
        [self unscheduleAllSelectors];
        
        // have everything stop
        CCNode* node;
        CCARRAY_FOREACH([self children], node)
        {
            [node pauseSchedulerAndActions];
        }
        
        // add the labels shown during game over
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        CCLabelTTF* gameOver = [CCLabelTTF labelWithString:@"Endless Mode" fontName:@"HelveticaNeue-Light" fontSize:40];
        gameOver.position = CGPointMake(160, 300);
        [self addChild:gameOver z:100 tag:100];
        
        CCLabelTTF* bosstag = [CCLabelTTF labelWithString:@"Level Select" fontName:@"HelveticaNeue-Light" fontSize:40];
        bosstag.position = CGPointMake(160, 50);
        [self addChild:bosstag z:100 tag:100];
        
        CCTintTo* tint = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
        [gameOver runAction:tint];
        CCTintTo* tint2 = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
        [bosstag runAction:tint2];
            
        CCSprite* background = [CCSprite spriteWithFile:@"back31.png"];
        background.position = ccp(160,284);
            [self setDimensionsInPixelsOnSprite:background width:320 height:568];
        
        [self addChild:background];
        
        CCMenuItemFont *playAgain = [CCMenuItemFont itemFromString: @"back" target:self selector:@selector(unPause)];
        CCMenuItemFont *restart = [CCMenuItemFont itemFromString: @"Endless Mode" target:self selector:@selector(level1)];
        CCMenuItemFont *quit = [CCMenuItemFont itemFromString: @"Scene Selection" target:self selector:@selector(level2)];
         CCMenuItemFont *obama = [CCMenuItemFont itemFromString: @"Level 3" target:self selector:@selector(obama)];

      /*CCMenu *gameOverMenu = [CCMenu menuWithItems:restart, quit, playAgain, nil];
        [gameOverMenu alignItemsVertically];
        gameOverMenu.position = ccp(screenSize.width/2, screenSize.height/2 - 80);
        gameOverMenu.color = ccc3(0, 0, 0);
        [self addChild:gameOverMenu];*/
                
        CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"endless.png" selectedImage:@"endless.png" target:self selector:@selector(level1)];
        highscore.position = ccp(160, 390);
        CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
        
        CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"bossmode.png" selectedImage:@"bossmode.png" target:self selector:@selector(level2)];
        boss.position = ccp(160, 150);
        CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
        moreMenu.position = CGPointZero;
        [self addChild:moreMenu];
        
        CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"back.png" selectedImage:@"back-sel.png" target:self selector:@selector(unPause)];
        back.position = ccp(50, 240);
        back.scale = 0.5;
        CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
        backmenu.position = CGPointZero;
        [self addChild:backmenu];
        }
        else{
            glClearColor(255, 255, 255, 255);
            [self unscheduleAllSelectors];
            
            // have everything stop
            CCNode* node;
            CCARRAY_FOREACH([self children], node)
            {
                [node pauseSchedulerAndActions];
            }
            
            // add the labels shown during game over
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            
            CCLabelTTF* gameOver = [CCLabelTTF labelWithString:@"Endless Mode" fontName:@"HelveticaNeue-Light" fontSize:30];
            gameOver.position = CGPointMake(160, 300);
            [self addChild:gameOver z:100 tag:100];
            
            CCLabelTTF* bosstag = [CCLabelTTF labelWithString:@"Level Select" fontName:@"HelveticaNeue-Light" fontSize:30];
            bosstag.position = CGPointMake(160, 50);
            [self addChild:bosstag z:100 tag:100];
            
            CCTintTo* tint = [CCTintTo actionWithDuration:0 red:0 green:0 blue:0];
            [gameOver runAction:tint];
            CCTintTo* tint2 = [CCTintTo actionWithDuration:0 red:0 green:0 blue:0];
            [bosstag runAction:tint2];
            
            CCSprite* background = [CCSprite spriteWithFile:@"back31.png"];
            background.position = ccp(screen.width/2,screen.height/2);
            
            [self addChild:background];
            
            CCMenuItemFont *playAgain = [CCMenuItemFont itemFromString: @"back" target:self selector:@selector(unPause)];
            CCMenuItemFont *restart = [CCMenuItemFont itemFromString: @"Endless Mode" target:self selector:@selector(level1)];
            CCMenuItemFont *quit = [CCMenuItemFont itemFromString: @"Scene Selection" target:self selector:@selector(level2)];
            CCMenuItemFont *obama = [CCMenuItemFont itemFromString: @"Level 3" target:self selector:@selector(obama)];
            /*CCMenu *gameOverMenu = [CCMenu menuWithItems:restart, quit, playAgain, nil];
             [gameOverMenu alignItemsVertically];
             gameOverMenu.position = ccp(screenSize.width/2, screenSize.height/2 - 80);
             gameOverMenu.color = ccc3(0, 0, 0);
             [self addChild:gameOverMenu];*/
            
            CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"endless.png" selectedImage:@"endless.png" target:self selector:@selector(level1)];
            highscore.position = ccp(160, 390);
            CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
            starMenu.position = CGPointZero;
            [self addChild:starMenu];
            
            CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"bossmode.png" selectedImage:@"bossmode.png" target:self selector:@selector(level2)];
            boss.position = ccp(160, 150);
            CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
            moreMenu.position = CGPointZero;
            [self addChild:moreMenu];
            
            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"back.png" selectedImage:@"back-sel.png" target:self selector:@selector(unPause)];
            back.position = ccp(50, 240);
            back.scale = 0.5;
            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
            backmenu.position = CGPointZero;
            [self addChild:backmenu];
        }
    }
    return self;
}

-(void) level2
{
   // NSNumber *leveldata = [NSNumber numberWithInteger:2];
   // [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    
    //NSLog([NSString stringWithFormat:@"%d", level]);
    //NSLog(@"d");
    
    [[CCDirector sharedDirector] replaceScene:
     [CCTransitionSlideInR transitionWithDuration:0.5f scene:[Scene node]]];
}

-(void) setDimensionsInPixelsOnSprite:(CCSprite *) spriteToSetDimensions width:(int) width height:(int) height
{
    spriteToSetDimensions.scaleX = width/[spriteToSetDimensions boundingBox].size.width;
    spriteToSetDimensions.scaleY = height/[spriteToSetDimensions boundingBox].size.height;
}

-(void) level1
{
    NSNumber *leveldata = [NSNumber numberWithInteger:1];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"endless"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionSlideInB transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
}

-(void) obama
{
    NSNumber *leveldata = [NSNumber numberWithInteger:3];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
}

-(void) unPause
{
    //    [[CCDirector sharedDirector] popSceneWithTransition:
    //       [CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionSlideInL transitionWithDuration:0.5f scene:[Title node]]];
}


@end
