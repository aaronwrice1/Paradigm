//
//  StatViewController.m
//  Paradigm
//
//  Created by Aaron on 2/14/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import "StatViewController.h"

@interface StatViewController ()

@end

@implementation StatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if([prefs integerForKey:@"graphType"] == 1){
        
        // [self createDotPlot1];
        [self createDotPlotWithColor:[UIColor redColor] andData:@"PerfectScores1"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 12){
        
        // [self createDotPlot2];
        [self createDotPlotWithColor:[UIColor redColor] andData:@"Scores1"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 2){
        
        // [self createDotPlot2];
        [self createDotPlotWithColor:[UIColor greenColor] andData:@"PerfectScores2"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 22){
        
        // [self createDotPlot2];
        [self createDotPlotWithColor:[UIColor greenColor] andData:@"Scores2"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 5){
        
        // [self createDotPlot5];
        [self createDotPlotWithColor:[UIColor blueColor] andData:@"PerfectScores5"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 52){
        
        // [self createDotPlot2];
        [self createDotPlotWithColor:[UIColor blueColor] andData:@"Scores5"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 10){
        
        // [self createDotPlot10];
        [self createDotPlotWithColor:[UIColor grayColor] andData:@"PerfectScores10"];
        
    }
    else if([prefs integerForKey:@"graphType"] == 102){
        
        // [self createDotPlot2];
        [self createDotPlotWithColor:[UIColor grayColor] andData:@"Scores10"];
        
    }
    
}

-(void)createDotPlotWithColor:(UIColor*)color andData:(NSString*)datasourse{
    
    NSArray *scoreArray;
    NSMutableArray *scoreArrayToUse;
    NSMutableArray *dotArray;
    
    scoreArrayToUse = [[NSMutableArray alloc] init];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // Scores10 - for regular scores
    // PerfectScores10 - for perfect runs
    
    if ([prefs objectForKey:datasourse]) {
        scoreArray = [[prefs objectForKey:datasourse] mutableCopy];
    }
    else{
        scoreArray = [[NSMutableArray alloc] init];
    }
    
    // sort them
    scoreArray = [scoreArray sortedArrayUsingFunction:sortScores context:NULL];
    // add them to a NSMutableArray to shorten
    [scoreArrayToUse addObjectsFromArray:scoreArray];
    
    
    // print out results
    NSLog(@"games played - %li", scoreArrayToUse.count);
    NSLog(@"lowest score - %i", [[scoreArrayToUse firstObject] intValue]);
    NSLog(@"highest score - %i", [[scoreArrayToUse lastObject] intValue]);
    
    for (int i = 0; i < scoreArrayToUse.count; i++) {
        int x = [[scoreArrayToUse objectAtIndex:i] intValue];
        
        NSLog(@"nums - %i", x);
        
    }
    
    // ===
    
    // find max number of repeated numbers
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:scoreArrayToUse];
    
    for (NSString *item in countedSet) {
        
        int count = (int)[countedSet countForObject: item];
        NSLog(@"the String ' %@ ' appears %d times in the array",item,count);
        
        NSString *string = [NSString stringWithFormat:@"%i", count];
        
        [newArray addObject: string];
        
    }
    
    NSArray *sortArray = newArray;
    sortArray = [sortArray sortedArrayUsingFunction:sortScores context:NULL];
    NSLog(@"Max number of repeated %i", [[sortArray lastObject] intValue]);
    
    // ===
    
    // make plot
    float min = [[scoreArrayToUse firstObject] intValue];
    float max = [[scoreArrayToUse lastObject] intValue];
    
    // max number of boxes in one column
    float maxH = [[sortArray lastObject] intValue];
    
    float offset = 3;
    float realWidth = ([[UIScreen mainScreen] bounds].size.width - (max-min) * offset) / (max - min + 1);
    float realHeight = ([[UIScreen mainScreen] bounds].size.height - (maxH-1) * offset) / maxH;
    
    dotArray = [[NSMutableArray alloc] init];
    
    // make squares
    for (int i = 0; i < scoreArrayToUse.count; i++) {
        
        int x = [[scoreArrayToUse objectAtIndex:i] intValue];
        
        UIImageView *dot;
        
        if (x-min == 0) {
            
            dot = [[UIImageView alloc] initWithFrame:CGRectMake((x-min) * realWidth,
                                                                [[UIScreen mainScreen] bounds].size.height - realHeight,
                                                                realWidth,
                                                                realHeight)];
            
        }
        else{
            
            dot = [[UIImageView alloc] initWithFrame:CGRectMake((x-min) * realWidth + (offset*(x-min)),
                                                                [[UIScreen mainScreen] bounds].size.height - realHeight,
                                                                realWidth,
                                                                realHeight)];
            
        }
        
        
        NSLog(@"x for square %i is %f", i, x * realWidth);
        
        // move dot and label up if one already exists
        for (int a = 0; a < dotArray.count; a++) {
            
            UIImageView *existingDot = [dotArray objectAtIndex:a];
            
            if (existingDot.frame.origin.x == dot.frame.origin.x) {
                
                if (x-min == 0) {
                    
                    [dot setFrame:CGRectMake((x-min) * realWidth,
                                             dot.frame.origin.y - realHeight - offset,
                                             realWidth,
                                             realHeight)];
                    
                    
                }
                else{
                    
                    [dot setFrame:CGRectMake((x-min) * realWidth + (offset*(x-min)),
                                             dot.frame.origin.y - realHeight - offset,
                                             realWidth,
                                             realHeight)];
                    
                }
                
            }
            
        }
        
        // count the number of times the minimum value is present
        unsigned int numMinValue = 0;
        
        for (unsigned int ii = 0; ii < scoreArrayToUse.count; ii++) {
            if ([[scoreArrayToUse objectAtIndex:ii] integerValue] == min) {
                numMinValue++;
            }
        }
        
        // add label for first and last squares
        if (i == numMinValue - 1 || i == scoreArrayToUse.count - 1 || dot.frame.origin.y <= 1) {
            
            if (dot.frame.origin.y > 20) {
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, -20, realWidth, 20)];
                [label setTextAlignment:NSTextAlignmentCenter];
                label.text = [NSString stringWithFormat:@"%i", x];
                [dot addSubview:label];
                
            }
            else{
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, realWidth, 20)];
                [label setTextAlignment:NSTextAlignmentCenter];
                label.text = [NSString stringWithFormat:@"%i", x];
                [dot addSubview:label];
                
            }
            
        }
        
        dot.backgroundColor = color;
        [self.view addSubview:dot];
        
        [dotArray addObject:dot];
    }
    
    
}


NSInteger sortScores(id id1, id id2, void *context)
{
    // Sort Function
    NSString* name1 = (NSString*)id1;
    NSString* name2 = (NSString*)id2;
    
    // return ([name2 compare:name1]);
    return ([name1 compare:name2 options:NSNumericSearch]);
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
