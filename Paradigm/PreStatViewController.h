//
//  PreStatViewController.h
//  Paradigm
//
//  Created by Aaron on 6/18/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreStatViewController : UIViewController {
    
    NSUserDefaults *prefs;
    
    int dataType;
    
    UILabel *best1;
    UILabel *avg1;
    UILabel *label1;
    UILabel *runs1;
    
    UILabel *best2;
    UILabel *avg2;
    UILabel *label2;
    UILabel *runs2;
    
    UILabel *best5;
    UILabel *avg5;
    UILabel *label5;
    UILabel *runs5;
    
    UILabel *best10;
    UILabel *avg10;
    UILabel *label10;
    UILabel *runs10;
    
}

@end
