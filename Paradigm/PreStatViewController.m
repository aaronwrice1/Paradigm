//
//  PreStatViewController.m
//  Paradigm
//
//  Created by Aaron on 6/18/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import "PreStatViewController.h"

@interface PreStatViewController ()

@end

@implementation PreStatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataType = 0;
    
    prefs = [NSUserDefaults standardUserDefaults];
    
    [self createLabels];
    [self createButtons];
    
}

-(void)createLabels{
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    float width = 150;
    float height = 50;
    float offset = 40;
    
    if ([prefs objectForKey:@"Scores1"]) {
        
        best1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2 - offset, width, height)];
        [best1 setTextAlignment:NSTextAlignmentRight];
        [best1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best1 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score1"]]];
        [best1 setTextColor:[UIColor redColor]];
        [self.view addSubview: best1];
        
        avg1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2, width, height)];
        [avg1 setTextAlignment:NSTextAlignmentRight];
        [avg1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg1 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores1"]]];
        [avg1 setTextColor:[UIColor redColor]];
        [self.view addSubview: avg1];
        
        label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2, width, height)];
        [label1 setTextAlignment:NSTextAlignmentLeft];
        [label1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label1 setText: @"   1s"];
        [label1 setTextColor:[UIColor redColor]];
        [self.view addSubview: label1];
        
        runs1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2 + offset, width, height)];
        [runs1 setTextAlignment:NSTextAlignmentRight];
        [runs1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs1 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores1"] count]]];
        [runs1 setTextColor:[UIColor redColor]];
        [self.view addSubview: runs1];
        
    }
    else{
        
        best1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2 - offset, width, height)];
        [best1 setTextAlignment:NSTextAlignmentRight];
        [best1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best1 setText: [NSString stringWithFormat:@"Best: 0"]];
        [best1 setTextColor:[UIColor redColor]];
        [self.view addSubview: best1];
        
        avg1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2, width, height)];
        [avg1 setTextAlignment:NSTextAlignmentRight];
        [avg1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg1 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [avg1 setTextColor:[UIColor redColor]];
        [self.view addSubview: avg1];
        
        label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2, width, height)];
        [label1 setTextAlignment:NSTextAlignmentLeft];
        [label1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label1 setText: @"   1s"];
        [label1 setTextColor:[UIColor redColor]];
        [self.view addSubview: label1];
        
        runs1 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.2 + offset, width, height)];
        [runs1 setTextAlignment:NSTextAlignmentRight];
        [runs1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs1 setText: [NSString stringWithFormat:@"Runs: 0"]];
        [runs1 setTextColor:[UIColor redColor]];
        [self.view addSubview: runs1];
        
    }
    
    if ([prefs objectForKey:@"Scores2"]) {
        
        best2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4 - offset, width, height)];
        [best2 setTextAlignment:NSTextAlignmentRight];
        [best2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best2 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score2"]]];
        [best2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: best2];
        
        avg2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4, width, height)];
        [avg2 setTextAlignment:NSTextAlignmentRight];
        [avg2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg2 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores2"]]];
        [avg2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: avg2];
        
        label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4, width, height)];
        [label2 setTextAlignment:NSTextAlignmentLeft];
        [label2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label2 setText: @"   2s"];
        [label2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: label2];
        
        runs2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4 + offset, width, height)];
        [runs2 setTextAlignment:NSTextAlignmentRight];
        [runs2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs2 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores2"] count]]];
        [runs2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: runs2];
        
    }
    else{
        
        best2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4 - offset, width, height)];
        [best2 setTextAlignment:NSTextAlignmentRight];
        [best2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best2 setText: [NSString stringWithFormat:@"Best: 0"]];
        [best2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: best2];
        
        avg2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4, width, height)];
        [avg2 setTextAlignment:NSTextAlignmentRight];
        [avg2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg2 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [avg2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: avg2];
        
        label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4, width, height)];
        [label2 setTextAlignment:NSTextAlignmentLeft];
        [label2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label2 setText: @"   2s"];
        [label2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: label2];
        
        runs2 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.4 + offset, width, height)];
        [runs2 setTextAlignment:NSTextAlignmentRight];
        [runs2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs2 setText: [NSString stringWithFormat:@"Runs: 0"]];
        [runs2 setTextColor:[UIColor greenColor]];
        [self.view addSubview: runs2];
        
    }
    
    if ([prefs objectForKey:@"Scores5"]) {
        
        best5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6 - offset, width, height)];
        [best5 setTextAlignment:NSTextAlignmentRight];
        [best5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best5 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score5"]]];
        [best5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: best5];
        
        avg5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6, width, height)];
        [avg5 setTextAlignment:NSTextAlignmentRight];
        [avg5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg5 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores5"]]];
        [avg5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: avg5];
        
        label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6, width, height)];
        [label5 setTextAlignment:NSTextAlignmentLeft];
        [label5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label5 setText: @"   5s"];
        [label5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: label5];
        
        runs5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6 + offset, width, height)];
        [runs5 setTextAlignment:NSTextAlignmentRight];
        [runs5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs5 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores5"] count]]];
        [runs5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: runs5];
        
    }
    else{
        
        best5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6 - offset, width, height)];
        [best5 setTextAlignment:NSTextAlignmentRight];
        [best5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best5 setText: [NSString stringWithFormat:@"Best: 0"]];
        [best5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: best5];
        
        avg5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6, width, height)];
        [avg5 setTextAlignment:NSTextAlignmentRight];
        [avg5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg5 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [avg5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: avg5];
        
        label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6, width, height)];
        [label5 setTextAlignment:NSTextAlignmentLeft];
        [label5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label5 setText: @"   5s"];
        [label5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: label5];
        
        runs5 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.6 + offset, width, height)];
        [runs5 setTextAlignment:NSTextAlignmentRight];
        [runs5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs5 setText: [NSString stringWithFormat:@"Runs: 0"]];
        [runs5 setTextColor:[UIColor blueColor]];
        [self.view addSubview: runs5];
        
    }
    
    if ([prefs objectForKey:@"Scores10"]) {
        
        best10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8 - offset, width, height)];
        [best10 setTextAlignment:NSTextAlignmentRight];
        [best10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best10 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score10"]]];
        [best10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: best10];
        
        avg10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8, width, height)];
        [avg10 setTextAlignment:NSTextAlignmentRight];
        [avg10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg10 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores10"]]];
        [avg10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: avg10];
        
        label10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8, width, height)];
        [label10 setTextAlignment:NSTextAlignmentLeft];
        [label10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label10 setText: @"   10s"];
        [label10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: label10];
        
        runs10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8 + offset, width, height)];
        [runs10 setTextAlignment:NSTextAlignmentRight];
        [runs10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs10 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores10"] count]]];
        [runs10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: runs10];
        
    }
    else{
        
        best10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8 - offset, width, height)];
        [best10 setTextAlignment:NSTextAlignmentRight];
        [best10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [best10 setText: [NSString stringWithFormat:@"Best: 0"]];
        [best10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: best10];
        
        avg10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8, width, height)];
        [avg10 setTextAlignment:NSTextAlignmentRight];
        [avg10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [avg10 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [avg10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: avg10];
        
        label10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8, width, height)];
        [label10 setTextAlignment:NSTextAlignmentLeft];
        [label10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [label10 setText: @"   10s"];
        [label10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: label10];
        
        runs10 = [[UILabel alloc] initWithFrame:CGRectMake(0, iosScreen.size.height*0.8 + offset, width, height)];
        [runs10 setTextAlignment:NSTextAlignmentRight];
        [runs10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
        [runs10 setText: [NSString stringWithFormat:@"Runs: 0"]];
        [runs10 setTextColor:[UIColor grayColor]];
        [self.view addSubview: runs10];
        
    }
   
    
}

-(void)updateLabels{
    
    if ([prefs objectForKey:@"Scores1"]) {
        
        
        [best1 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score1"]]];
        [avg1 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores1"]]];
        [label1 setText: @"   1s"];
        [runs1 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores1"] count]]];
       
        
    }
    else{
        
        
        [best1 setText: [NSString stringWithFormat:@"Best: 0"]];
        [avg1 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [label1 setText: @"   1s"];
        [runs1 setText: [NSString stringWithFormat:@"Runs: 0"]];
        
    }
    
    if ([prefs objectForKey:@"Scores2"]) {
        
        [best2 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score2"]]];
        [avg2 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores2"]]];
        [label2 setText: @"   2s"];
        [runs2 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores2"] count]]];
        
    }
    else{
        
        
        [best2 setText: [NSString stringWithFormat:@"Best: 0"]];
        [avg2 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [label2 setText: @"   2s"];
        [runs2 setText: [NSString stringWithFormat:@"Runs: 0"]];
        
    }
    
    if ([prefs objectForKey:@"Scores5"]) {
        
        
        [best5 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score5"]]];
        [avg5 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores5"]]];
        [label5 setText: @"   5s"];
        [runs5 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores5"] count]]];
       
        
    }
    else{
        
        
        [best5 setText: [NSString stringWithFormat:@"Best: 0"]];
        [avg5 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [label5 setText: @"   5s"];
        [runs5 setText: [NSString stringWithFormat:@"Runs: 0"]];
        
        
    }
    
    if ([prefs objectForKey:@"Scores10"]) {
        
        
        [best10 setText: [NSString stringWithFormat:@"Best: %li", (long)[prefs integerForKey:@"score10"]]];
        [avg10 setText: [NSString stringWithFormat:@"Avg: %i", [self calcAvg:@"Scores10"]]];
        [label10 setText: @"   10s"];
        [runs10 setText: [NSString stringWithFormat:@"Runs: %li", [[prefs objectForKey:@"Scores10"] count]]];
        
        
    }
    else{
        
        
        [best10 setText: [NSString stringWithFormat:@"Best: 0"]];
        [avg10 setText: [NSString stringWithFormat:@"Avg: 0"]];
        [label10 setText: @"   10s"];
        [runs10 setText: [NSString stringWithFormat:@"Runs: 0"]];
        
        
    }
    
    
}

-(int)calcAvg:(NSString*)identifier{
    
    NSMutableArray *scoreArray = [[NSMutableArray alloc] init];
    scoreArray = [[prefs objectForKey:identifier] mutableCopy];
    
    // calculate average
    int avg = 0;
    
    for (int i = 0; i < scoreArray.count; i++) {
        
        // NSLog(@"%@", [scoreArray objectAtIndex:i]);
        
        avg += [[scoreArray objectAtIndex:i] intValue];
        
    }
    
    avg = avg / scoreArray.count;
    
    return avg;
}

-(void)createButtons{
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    int buttonOffset = 40;
    
    UIButton *buttonGraph1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph1 setTitle:@"Graph Perfect Scores" forState:UIControlStateNormal];
    buttonGraph1.frame = CGRectMake(200, iosScreen.size.height*0.2, 150, 50);
    buttonGraph1.tag = 1;
    [self.view addSubview:buttonGraph1];
    
    UIButton *buttonGraph12 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph12 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph12 setTitle:@"Graph All Scores" forState:UIControlStateNormal];
    buttonGraph12.frame = CGRectMake(200, iosScreen.size.height*0.2 - buttonOffset, 150, 50);
    buttonGraph12.tag = 12;
    [self.view addSubview:buttonGraph12];
    
    UIButton *buttonGraphClear1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraphClear1 addTarget:self action:@selector(clearData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraphClear1 setTitle:@"Clear Data" forState:UIControlStateNormal];
    buttonGraphClear1.frame = CGRectMake(200, iosScreen.size.height*0.2 + buttonOffset, 150, 50);
    buttonGraphClear1.tag = 1;
    [self.view addSubview:buttonGraphClear1];
    
    UIButton *buttonGraph2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph2 setTitle:@"Graph Perfect Scores" forState:UIControlStateNormal];
    buttonGraph2.frame = CGRectMake(200, iosScreen.size.height*0.4, 150, 50);
    buttonGraph2.tag = 2;
    [self.view addSubview:buttonGraph2];
    
    UIButton *buttonGraph22 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph22 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph22 setTitle:@"Graph All Scores" forState:UIControlStateNormal];
    buttonGraph22.frame = CGRectMake(200, iosScreen.size.height*0.4 - buttonOffset, 150, 50);
    buttonGraph22.tag = 22;
    [self.view addSubview:buttonGraph22];
    
    UIButton *buttonGraphClear2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraphClear2 addTarget:self action:@selector(clearData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraphClear2 setTitle:@"Clear Data" forState:UIControlStateNormal];
    buttonGraphClear2.frame = CGRectMake(200, iosScreen.size.height*0.4 + buttonOffset, 150, 50);
    buttonGraphClear2.tag = 2;
    [self.view addSubview:buttonGraphClear2];
    
    UIButton *buttonGraph5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph5 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph5 setTitle:@"Graph Perfect Scores" forState:UIControlStateNormal];
    buttonGraph5.frame = CGRectMake(200, iosScreen.size.height*0.6, 150, 50);
    buttonGraph5.tag = 5;
    [self.view addSubview:buttonGraph5];
    
    UIButton *buttonGraph52 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph52 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph52 setTitle:@"Graph All Scores" forState:UIControlStateNormal];
    buttonGraph52.frame = CGRectMake(200, iosScreen.size.height*0.6 - buttonOffset, 150, 50);
    buttonGraph52.tag = 52;
    [self.view addSubview:buttonGraph52];
    
    UIButton *buttonGraphClear5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraphClear5 addTarget:self action:@selector(clearData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraphClear5 setTitle:@"Clear Data" forState:UIControlStateNormal];
    buttonGraphClear5.frame = CGRectMake(200, iosScreen.size.height*0.6 + buttonOffset, 150, 50);
    buttonGraphClear5.tag = 5;
    [self.view addSubview:buttonGraphClear5];
    
    UIButton *buttonGraph10 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph10 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph10 setTitle:@"Graph Perfect Scores" forState:UIControlStateNormal];
    buttonGraph10.frame = CGRectMake(200, iosScreen.size.height*0.8, 150, 50);
    buttonGraph10.tag = 10;
    [self.view addSubview:buttonGraph10];
    
    UIButton *buttonGraph102 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraph102 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraph102 setTitle:@"Graph All Scores" forState:UIControlStateNormal];
    buttonGraph102.frame = CGRectMake(200, iosScreen.size.height*0.8 - buttonOffset, 150, 50);
    buttonGraph102.tag = 102;
    [self.view addSubview:buttonGraph102];
    
    UIButton *buttonGraphClear10 = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGraphClear10 addTarget:self action:@selector(clearData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGraphClear10 setTitle:@"Clear Data" forState:UIControlStateNormal];
    buttonGraphClear10.frame = CGRectMake(200, iosScreen.size.height*0.8 + buttonOffset, 150, 50);
    buttonGraphClear10.tag = 10;
    [self.view addSubview:buttonGraphClear10];
    
    
}

-(void)buttonPressed:(UIButton*)sender{
    
    [prefs setInteger:sender.tag forKey:@"graphType"];
    
    [self goToGraph];
    
}

-(void)clearData:(UIButton*)sender{
    
    dataType = (int)sender.tag;
    
    NSString *string = [NSString stringWithFormat:@"Clear perfect scores, failed scores, or all scores for only %li second data", (long)sender.tag];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What to Clear?"
                                                    message:string
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Perfect", @"Fails", @"All", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSString *perfectString = [NSString stringWithFormat:@"PerfectScores%i", dataType];
    NSString *string = [NSString stringWithFormat:@"Scores%i", dataType];
    NSString *bestScoreString = [NSString stringWithFormat:@"score%i", dataType];
    
    if (buttonIndex == 1) {
        
        NSMutableArray *scoreArray = [prefs objectForKey:string];
        NSMutableArray *perfectScoreArray = [prefs objectForKey:perfectString];
        
        [scoreArray removeObjectsInArray:perfectScoreArray];
        
        [prefs setObject:scoreArray forKey:string];
        [prefs setObject:0 forKey:perfectString];
        [prefs setObject:[scoreArray valueForKeyPath:@"@max.intValue"] forKey:bestScoreString];
        
        [self updateLabels];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Cleared"
                                                        message:@"Play more games to get more stats!"
                                                       delegate:self
                                              cancelButtonTitle:@"Cool!"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    else if (buttonIndex == 2){
        
        [prefs setObject:0 forKey:string];
        [prefs setObject:[prefs objectForKey:perfectString] forKey:string];
        [prefs setObject:[[prefs objectForKey:perfectString] valueForKeyPath:@"@max.intValue"] forKey:bestScoreString];
        
        [self updateLabels];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Cleared"
                                                        message:@"Play more games to get more stats!"
                                                       delegate:self
                                              cancelButtonTitle:@"Cool!"
                                              otherButtonTitles:nil];
        [alert show];
        
        
    }
    else if (buttonIndex == 3){
        
        [prefs setObject:0 forKey:perfectString];
        [prefs setObject:0 forKey:string];
        [prefs setObject:0 forKey:bestScoreString];
        
        [self updateLabels];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Cleared"
                                                        message:@"Play more games to get more stats!"
                                                       delegate:self
                                              cancelButtonTitle:@"Cool!"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

-(void)goToGraph{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"Stat"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
