//
//  ViewController.h
//  Push
//
//  Created by Denis Lyakhovich on 18.06.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    // Add these AVAudioPlayer objects
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}
    //pressing the buttun and getting the points
    - (IBAction)buttonPush;
    //initial setup music and time and called subtract time method
    - (void)setupGame;
    //finds time to notify about the results
    - (void)subtractTime;
    //show warning
    - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
    //create and return object of audio player
    - (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type;

@end

