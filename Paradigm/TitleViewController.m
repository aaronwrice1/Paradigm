//
//  TitleViewController.m
//  Paradigm
//
//  Created by Aaron on 1/30/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createButtons];
    [self createHighScoreLabels];
    
}

-(void)createButtons{
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
                action:@selector(button1)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"1s" forState:UIControlStateNormal];
    button1.frame = CGRectMake(0, 0, iosScreen.size.width, iosScreen.size.height/5 + 1);
    // button1.backgroundColor = [UIColor redColor];
    [button1 setImage:[UIImage imageNamed:@"oneSecondPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
                action:@selector(button2)
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"2s" forState:UIControlStateNormal];
    button2.frame = CGRectMake(0, iosScreen.size.height * .2, iosScreen.size.width, iosScreen.size.height/5);
    // button2.backgroundColor = [UIColor greenColor];
    [button2 setImage:[UIImage imageNamed:@"twoSecondPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    GCbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [GCbutton addTarget:self
                   action:@selector(goToGC)
         forControlEvents:UIControlEventTouchUpInside];
    [GCbutton setTitle:@"GC" forState:UIControlStateNormal];
    GCbutton.frame = CGRectMake(0, iosScreen.size.height * .4, iosScreen.size.width/2, iosScreen.size.height/5);
    // GCbutton.backgroundColor = [UIColor yellowColor];
    [GCbutton setImage:[UIImage imageNamed:@"GCPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:GCbutton];
    
    statbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [statbutton addTarget:self
                   action:@selector(goToStat)
         forControlEvents:UIControlEventTouchUpInside];
    [statbutton setTitle:@"Stats" forState:UIControlStateNormal];
    statbutton.frame = CGRectMake(iosScreen.size.width / 2, iosScreen.size.height * .4, iosScreen.size.width/2, iosScreen.size.height/5);
    // statbutton.backgroundColor = [UIColor orangeColor];
    [statbutton setImage:[UIImage imageNamed:@"StatsPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:statbutton];
    
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self
                action:@selector(button5)
      forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"5s" forState:UIControlStateNormal];
    button3.frame = CGRectMake(0, iosScreen.size.height * .6, iosScreen.size.width, iosScreen.size.height/5);
    // button3.backgroundColor = [UIColor blueColor];
    [button3 setImage:[UIImage imageNamed:@"fiveSecondPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:button3];
    
    button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 addTarget:self
                action:@selector(button10)
      forControlEvents:UIControlEventTouchUpInside];
    [button4 setTitle:@"10s" forState:UIControlStateNormal];
    button4.frame = CGRectMake(0, iosScreen.size.height * .8, iosScreen.size.width, iosScreen.size.height/5);
    // button4.backgroundColor = [UIColor lightGrayColor];
    [button4 setImage:[UIImage imageNamed:@"tenSecondPic.png"] forState:UIControlStateNormal];
    [self.view addSubview:button4];
    
    infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [infoButton addTarget:self action:@selector(goToInfo) forControlEvents:UIControlEventTouchUpInside];
    infoButton.frame = CGRectMake(iosScreen.size.width - 30, 10, 20, 20);
    [infoButton setTintColor:[UIColor whiteColor]];
    [self.view addSubview:infoButton];
    
    // NSLog(@"w %f, h %f", button1.frame.size.width, button1.frame.size.height);
    
}

-(void)createHighScoreLabels{
    
    // put labels over and to the bottom right of each square
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    highScoreLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, button1.frame.origin.y + button1.frame.size.height - 30,
                                                                iosScreen.size.width, 30)];
    [highScoreLabel1 setTextAlignment: NSTextAlignmentRight];
    [highScoreLabel1 setFont: [UIFont fontWithName:@"Avenir" size:17]];
    [highScoreLabel1 setText: [NSString stringWithFormat:@"High Score: %li", (long)[prefs integerForKey:@"score1"]]];
    [highScoreLabel1 setTextColor:[UIColor whiteColor]];
    [self.view addSubview: highScoreLabel1];
    
    highScoreLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, button2.frame.origin.y + button2.frame.size.height - 30,
                                                                iosScreen.size.width, 30)];
    [highScoreLabel2 setTextAlignment: NSTextAlignmentRight];
    [highScoreLabel2 setFont: [UIFont fontWithName:@"Avenir" size:17]];
    [highScoreLabel2 setText: [NSString stringWithFormat:@"High Score: %li", (long)[prefs integerForKey:@"score2"]]];
    [highScoreLabel2 setTextColor:[UIColor whiteColor]];
    [self.view addSubview: highScoreLabel2];
    
    highScoreLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(0, button3.frame.origin.y + button3.frame.size.height - 30,
                                                                iosScreen.size.width, 30)];
    [highScoreLabel5 setTextAlignment: NSTextAlignmentRight];
    [highScoreLabel5 setFont: [UIFont fontWithName:@"Avenir" size:17]];
    [highScoreLabel5 setText: [NSString stringWithFormat:@"High Score: %li", (long)[prefs integerForKey:@"score5"]]];
    [highScoreLabel5 setTextColor:[UIColor whiteColor]];
    [self.view addSubview: highScoreLabel5];
    
    highScoreLabel10 = [[UILabel alloc] initWithFrame:CGRectMake(0, button4.frame.origin.y + button4.frame.size.height - 30,
                                                                 iosScreen.size.width, 30)];
    [highScoreLabel10 setTextAlignment: NSTextAlignmentRight];
    [highScoreLabel10 setFont: [UIFont fontWithName:@"Avenir" size:17]];
    [highScoreLabel10 setText: [NSString stringWithFormat:@"High Score: %li", (long)[prefs integerForKey:@"score10"]]];
    [highScoreLabel10 setTextColor:[UIColor whiteColor]];
    [self.view addSubview: highScoreLabel10];
    
}

-(void)button1{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:1 forKey:@"mode"];
    
    [self goToGame];
    
}

-(void)button2{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:2 forKey:@"mode"];
    
    [self goToGame];
}

-(void)button5{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:5 forKey:@"mode"];
    
    [self goToGame];
    
}

-(void)button10{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:10 forKey:@"mode"];
    
    [self goToGame];
}

-(void)goToGame{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"Game"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(void)goToGC{
    
    // show GC scores or go to a view that does have them
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if ([[prefs objectForKey:@"userWantsGameCenter"] isEqualToString:@"YES"]) {
        
        GKGameCenterViewController *gameCenterViewController = [[GKGameCenterViewController alloc] init];
        gameCenterViewController.gameCenterDelegate = self;
        [self presentViewController:gameCenterViewController animated:YES completion:^{
            // do something
        }];
        
    }
    else{
        
        // ask if user wants to use Game Center
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Center?"
                                                        message:@"Would you like to connect to Game Center to compare to people around the world?"
                                                       delegate:self
                                              cancelButtonTitle:@"No Thank You"
                                              otherButtonTitles:@"Of Course!", nil];
        [alert show];
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:@"YES" forKey:@"userWantsGameCenter"];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Awesome!"
                                                        message:@"We'll log you in."
                                                       delegate:self
                                              cancelButtonTitle:@"Sweet"
                                              otherButtonTitles:nil];
        [alert show];
        
        // log user in
        [[GCHelper sharedInstance] authenticateLocalUser];
    }
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
    if(gameCenterViewController) {
        [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"GCVC: DidFinish ...");
    } else {
        NSLog(@"%s [Controller Error]", __PRETTY_FUNCTION__);
    }
}

-(void)goToStat{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"PreStat"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
    
}

-(void)goToInfo{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"info"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
    
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
