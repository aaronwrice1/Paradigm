//
//  ViewController.h
//  Paradigm
//
//  Created by Aaron on 1/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import <GameKit/GameKit.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>{
    
    int score;
    bool canTouch;
    bool canStart;
    
    UILabel *scoreLabel;
    
    UIImageView *progressView;
    
    float progressViewHeight;
    float progressViewY;
    
    NSTimer *progressViewTimer;
    
    UIImageView *loseView;
    
    // in lose view
    UILabel *highScoreLabel;
    
    AVAudioPlayer *player;
    
    NSMutableArray *scoreArray;
    
    // Colors that the user chose
    UIColor *color1;
    UIColor *color2;
}

@property NSDate *startDate;
@property NSTimer *stopWatchTimer;

@end

