//
//  TitleViewController.h
//  Paradigm
//
//  Created by Aaron on 1/30/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GCHelper.h"

@interface TitleViewController : UIViewController <GKGameCenterControllerDelegate>{
    
    UILabel *highScoreLabel1;
    UILabel *highScoreLabel2;
    UILabel *highScoreLabel5;
    UILabel *highScoreLabel10;
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    
    UIButton *statbutton;
    UIButton *GCbutton;
    
    UIButton *infoButton;
    
    
}

@end
