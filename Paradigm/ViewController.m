//
//  ViewController.m
//  Paradigm
//
//  Created by Aaron on 1/29/15.
//  Copyright (c) 2015 Aaron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    CGRect iosScreen = [[UIScreen mainScreen] bounds];
    
    // create scorelabel
    
    scoreLabel =[[UILabel alloc] initWithFrame:
                 CGRectMake(0, iosScreen.size.height / 7, iosScreen.size.width, iosScreen.size.height / 6)];
    // scoreLabel.font = [UIFont fontWithName:@"System" size:30.0];
    // scoreLabel.adjustsFontSizeToFitWidth=YES;
    [scoreLabel setFont:[UIFont fontWithName:@"Avenir" size:110.0]];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.textColor = [UIColor blackColor];
    scoreLabel.text=@"0";
    // scoreLabel.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.5f];
    // scoreLabel.layer.borderColor=[UIColor blackColor].CGColor;
    // scoreLabel.layer.borderWidth=1.0f;
    // scoreLabel.layer.cornerRadius = 6.0f;
    [self.view addSubview:scoreLabel];
    
    score = 0;
    [self createLoseView];
    
    canTouch = YES;
    canStart = YES;
    
    progressViewHeight = 20;
    progressViewY = iosScreen.size.height / 3;
    
    progressView = [[UIImageView alloc] initWithFrame:CGRectMake(0, progressViewY,
                                                                 [[UIScreen mainScreen] bounds].size.width,
                                                                 progressViewHeight)];
    progressView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    [self.view addSubview: progressView];
     
}

-(void)createLoseView{
    
    // create loseView and put it out of view
    loseView = [[UIImageView alloc] initWithFrame:CGRectMake(75, -300, 250, 200)];
    [loseView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, -300)];
    float r = (float)(arc4random() % 11) / 10;
    float g = (float)(arc4random() % 11) / 10;
    float b = (float)(arc4random() % 11) / 10;
    
    // make sure color isn't too dark
    float avg = (r + g + b)/3;
    
    while (avg < 0.3) {
        
        r = (float)(arc4random() % 11) / 10;
        g = (float)(arc4random() % 11) / 10;
        b = (float)(arc4random() % 11) / 10;
        
        avg = (r + g + b)/3;
    }
    
    
    loseView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    loseView.layer.cornerRadius = 10; // how round the button is
    [loseView setUserInteractionEnabled:YES];
    [self.view addSubview:loseView];
    
    // add label to view
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(loseView.frame.size.width/4, -10, 200, 100)];
    // [label setCenter:CGPointMake(loseView.frame.size.width/2.0, loseView.frame.size.height/4.0)];
    label.text = @"Game Over";
    label.font = [UIFont fontWithName:@"Avenir" size:20];
    [loseView addSubview:label];
    
    // add high score label to view
    highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(loseView.frame.size.width/4, 15, 200, 100)];
    // [label setCenter:CGPointMake(loseView.frame.size.width/2.0, loseView.frame.size.height/4.0)];
    highScoreLabel.text = @"High Score";
    highScoreLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    [loseView addSubview:highScoreLabel];
    
    // add buttons to view
    // be sure to make backgrounds in gimp
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:self
                   action:@selector(goToMenu)
         forControlEvents:UIControlEventTouchUpInside];
    // [backButton setTitle:@"Back" forState:UIControlStateNormal];
    // backButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20.0];
    backButton.layer.cornerRadius = 10; // how round the button is
    backButton.clipsToBounds = YES;
    [backButton setImage:[UIImage imageNamed:@"BackButton.png"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(35, 100, 75, 75);
    [loseView addSubview:backButton];
    
    UIButton *replayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [replayButton addTarget:self
                     action:@selector(replay)
           forControlEvents:UIControlEventTouchUpInside];
    // [replayButton setTitle:@"Replay" forState:UIControlStateNormal];
    // replayButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20.0];
    replayButton.layer.cornerRadius = 10; // how round the button is
    replayButton.clipsToBounds = YES;
    [replayButton setImage:[UIImage imageNamed:@"ReplayButton.png"] forState:UIControlStateNormal];
    replayButton.frame = CGRectMake(135, 100, 75, 75);
    [loseView addSubview:replayButton];
    
}

-(void)goToMenu{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MainMenu"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(void)replay{
    
    score = -1;
    [self updateScore];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self dismissLoseView];
    
    // reset progress bar
    [UIView animateWithDuration:.25 animations:^{
        
        [progressView setFrame:CGRectMake(0, progressViewY, [[UIScreen mainScreen] bounds].size.width, progressViewHeight)];
        
    }];
    
}

-(void)presentLoseScreen{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [NSString stringWithFormat:@"score%li", (long)[prefs integerForKey:@"mode"]];
    highScoreLabel.text = [NSString stringWithFormat:@"High Score: %li", (long)[prefs integerForKey:string]];
    
    // make sure its ontop
    [self.view bringSubviewToFront:loseView];
    
    // set loseView to top
    [loseView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, -300)];
    
    // then animate
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [loseView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
    } completion:^(BOOL fin){
        NSLog(@"finished presenting");
    }];
    
}

-(void)dismissLoseView{
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //[loseView setFrame:CGRectMake(75, 300, 200, 200)];
        [loseView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2,
                                        [[UIScreen mainScreen] bounds].size.height + 100)];
    } completion:^(BOOL fin){
        
        // once loseView is gone allow user interaction
        
        canTouch = YES;
        canStart = YES;
    }];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (canStart) {
        
        [self startAnimatingProgressView];
        
        canStart = NO;
    }
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    if (canTouch) {
        
        if (location.x > [[UIScreen mainScreen] bounds].size.width/2) {
            
            if (self.view.backgroundColor == [UIColor cyanColor]) {
                // continue
                
                [self playSound];
                
                [self updateScore];
                
                int a = arc4random() % 2;
                
                if (a == 1) {
                    self.view.backgroundColor = [UIColor magentaColor];
                }
                
            }
            else{
                // fail
                
                [self stopTimer];
                [self playSoundWrong];
                [self saveScore: NO];
                [self presentLoseScreen];
                canTouch = NO;
                
                
            }
            
        }
        else{
            
            if (self.view.backgroundColor == [UIColor cyanColor]) {
                // fail
                
                [self stopTimer];
                [self playSoundWrong];
                [self saveScore: NO];
                [self presentLoseScreen];
                canTouch = NO;
                
            }
            else{
                // continue
                
                [self playSound];
                
                [self updateScore];
                
                int a = arc4random() % 2;
                
                if (a == 1) {
                    self.view.backgroundColor = [UIColor cyanColor];
                }
                
            }
        }
    }
}

-(void)startAnimatingProgressView{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    progressViewTimer = [NSTimer scheduledTimerWithTimeInterval: ((int)[prefs integerForKey:@"mode"]*.5) /
                                                                    [[UIScreen mainScreen] bounds].size.width
                                                         target:self
                                                       selector:@selector(updateBox)
                                                       userInfo:nil
                                                        repeats:YES];
    
}

-(void)updateBox{
    
    CGRect rect = progressView.frame;
    rect.size.width -= 0.5;
    
    if (rect.size.width <= 0) {
        rect.size.width = 0;
        
        canStart = NO;
        canTouch = NO;
        
        [self stopTimer];
        [self playSoundFinished];
        [self saveScore:YES];
        [self presentLoseScreen];
        
        NSLog(@"stopped timer");
    }
    
    [progressView setFrame: rect];
    
}

-(void)stopTimer{
    
    [progressViewTimer invalidate];
    
}

-(void)updateScore{
    
    score++;
    scoreLabel.text = [NSString stringWithFormat:@"%i",score];
    
}

-(void)saveScore:(BOOL)perfectRun{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *newScoreKey;
    NSString *scoreIdentifier;
    NSString *allScoresKey;
    NSString *perfectScoresKey;
    
    newScoreKey = [NSString stringWithFormat:@"score%li", (long)[prefs integerForKey:@"mode"]];
    scoreIdentifier = [NSString stringWithFormat:@"%liSecondScore", (long)[prefs integerForKey:@"mode"]];
    allScoresKey = [NSString stringWithFormat:@"Scores%li", (long)[prefs integerForKey:@"mode"]];
    perfectScoresKey = [NSString stringWithFormat:@"PerfectScores%li", (long)[prefs integerForKey:@"mode"]];
    
    if (score > [prefs integerForKey:newScoreKey]) {
        [prefs setInteger:score forKey:newScoreKey];
        
        // add to game center
        [self reportHighScore:score withIdentifier:scoreIdentifier];
    }
    
    scoreArray = [[prefs objectForKey:allScoresKey] mutableCopy];
    
    if (scoreArray == nil) {
        scoreArray = [[NSMutableArray alloc] init];
    }
    
    [scoreArray addObject: scoreLabel.text];
    
    [prefs setObject:scoreArray forKey:allScoresKey];
    
    // for perfect runs
    if (perfectRun) {
        
        // add to array for stats
        scoreArray = [[prefs objectForKey:perfectScoresKey] mutableCopy];
        
        if (scoreArray == nil) {
            scoreArray = [[NSMutableArray alloc] init];
        }
        
        [scoreArray addObject: scoreLabel.text];
        
        [prefs setObject:scoreArray forKey:perfectScoresKey];
        
        // add to game center
        [self reportHighScore:score withIdentifier:scoreIdentifier];
    }
}

- (void) reportHighScore:(NSInteger) highScore withIdentifier:(NSString *)identifier {
    if ([GKLocalPlayer localPlayer].isAuthenticated) {
        GKScore* scoreToSend = [[GKScore alloc] initWithLeaderboardIdentifier: identifier ];
        scoreToSend.value = highScore;
        [GKScore reportScores:@[scoreToSend] withCompletionHandler:^(NSError *error) {
            
            NSLog(@"Score was sent!!!");
            
            if (error) {
                // handle error
            }
        }];
    }
}

-(void)playSound{
    
    // stop current sound and play over again
    
    [player stop];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Rewarding"
                                                              ofType:@"m4a"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                    error:nil];
    player.delegate = self;
    player.numberOfLoops = 0;
    
    [player play];
    
}

-(void)playSoundWrong{
    
    // stop current sound and play over again
    
    [player stop];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wrong"
                                                              ofType:@"m4a"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                    error:nil];
    player.delegate = self;
    player.numberOfLoops = 0;
    
    [player play];
    
}

-(void)playSoundFinished{
    
    // stop current sound and play over again
    
    [player stop];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"finished"
                                                              ofType:@"m4a"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                    error:nil];
    player.delegate = self;
    player.numberOfLoops = 0;
    
    [player play];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

@end
