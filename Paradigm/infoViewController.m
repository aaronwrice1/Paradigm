//
//  infoViewController.m
//  Paradigm
//
//  Created by Aaron on 6/13/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    topLabel.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (1.0f/7.0f));
    [topLabel setTextAlignment: NSTextAlignmentCenter];
    [topLabel setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [topLabel setText: [NSString stringWithFormat:@"How To Play"]];
    [self.view addSubview: topLabel];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    leftLabel.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (2.0f/7.0f));
    [leftLabel setTextAlignment: NSTextAlignmentCenter];
    [leftLabel setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [leftLabel setText: [NSString stringWithFormat:@"Tap Left if the color is pink."]];
    [self.view addSubview: leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    rightLabel.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (3.0f/7.0f));
    [rightLabel setTextAlignment: NSTextAlignmentCenter];
    [rightLabel setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [rightLabel setText: [NSString stringWithFormat:@"Tap Right if the color is blue."]];
    [self.view addSubview: rightLabel];
    
    UILabel *whatLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    whatLabel.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (4.0f/7.0f));
    [whatLabel setTextAlignment: NSTextAlignmentCenter];
    [whatLabel setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [whatLabel setText: [NSString stringWithFormat:@"Get as far as you can"]];
    [self.view addSubview: whatLabel];
    
    UILabel *what2Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    what2Label.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (5.0f/7.0f));
    [what2Label setTextAlignment: NSTextAlignmentCenter];
    [what2Label setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [what2Label setText: [NSString stringWithFormat:@"Within the time."]];
    [self.view addSubview: what2Label];
    
    UILabel *continueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iosScreen.size.width, 30)];
    continueLabel.center = CGPointMake(iosScreen.size.width/2, iosScreen.size.height * (6.0f/7.0f));
    [continueLabel setTextAlignment: NSTextAlignmentCenter];
    [continueLabel setFont: [UIFont fontWithName:@"Avenir" size:23]];
    [continueLabel setText: [NSString stringWithFormat:@"Tap To Continue"]];
    [self.view addSubview: continueLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
