//
//  ViewController.m
//  Push
//
//  Created by Denis Lyakhovich on 18.06.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LabelScoreTimer.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LabelScoreTimer.png"]];
    //Add image of scoreLabel and timerLabel
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    // Add sound and music
    
    [self setupGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPush {
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score:\n%li", (long)count];
    [buttonBeep play];
}

- (void)setupGame {
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
    seconds = 30;
    count = 0;
    timerLabel.text = [NSString stringWithFormat:@"Time:\n%li", (long)seconds];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)subtractTime {
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time:\n%li", (long)seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score:\n%li", (long)count];
    [secondBeep play];
    if (seconds == 0) {
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %li points", (long)count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
    
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    return audioPlayer;
}

@end
