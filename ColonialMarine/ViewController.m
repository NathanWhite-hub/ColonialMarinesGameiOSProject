//
//  ViewController.m
//  ColonialMarine
//
//  Created by  on 4/29/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self setUpMusic];
    
    Engine * myEngine = [Engine sharedInstance];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    [myEngine.sadMusic stop];
    
    [myEngine.menuMusic play];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpMusic
{
    
    Engine * myEngine = [Engine sharedInstance];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"backgroundhangersounds" withExtension:@"aiff"];
    NSError *error1 = nil;
    myEngine.hangerSounds = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:&error1];
    
    [myEngine.hangerSounds setNumberOfLoops:-1];
    
    [myEngine.hangerSounds setVolume:.75];
    
    [myEngine.hangerSounds prepareToPlay];
    
    
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"backgroundmusic1" withExtension:@"mp3"];
    NSError *error2 = nil;
    myEngine.gameMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
    
    [myEngine.gameMusic setNumberOfLoops:-1];
    
    [myEngine.gameMusic setVolume: .5];
    
    [myEngine.gameMusic prepareToPlay];
    
    
    NSURL *url3 = [[NSBundle mainBundle] URLForResource:@"MainTheme" withExtension:@"mp3"];
    NSError *error3 = nil;
    myEngine.menuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:&error3];
    
    [myEngine.menuMusic setNumberOfLoops:-1];
    
    [myEngine.menuMusic setVolume:.5];
    
    [myEngine.menuMusic prepareToPlay];
    
    
    NSURL *url4 = [[NSBundle mainBundle] URLForResource:@"combatdropmusic" withExtension:@"aiff"];
    NSError *error4 = nil;
    myEngine.combatDropMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url4 error:&error4];
    
    [myEngine.combatDropMusic setNumberOfLoops:-1];
    
    [myEngine.combatDropMusic setVolume:.75];
    
    [myEngine.combatDropMusic prepareToPlay];
    
    NSURL *url5 = [[NSBundle mainBundle] URLForResource:@"motiontrackercontactslow" withExtension:@"aiff"];
    NSError *error5 = nil;
    myEngine.motionTrackerSlow = [[AVAudioPlayer alloc] initWithContentsOfURL:url5 error:&error5];
    
    [myEngine.motionTrackerSlow setNumberOfLoops:-1];
    
    [myEngine.motionTrackerSlow setVolume:.75];
    
    [myEngine.motionTrackerSlow prepareToPlay];
    
    NSURL *url6 = [[NSBundle mainBundle] URLForResource:@"motiontrackercontactmedium" withExtension:@"aiff"];
    NSError *error6 = nil;
    myEngine.motionTrackerMedium = [[AVAudioPlayer alloc] initWithContentsOfURL:url6 error:&error6];
    
    [myEngine.motionTrackerMedium setNumberOfLoops:-1];
    
    [myEngine.motionTrackerMedium setVolume:.75];
    
    [myEngine.motionTrackerMedium prepareToPlay];
    
    NSURL *url7 = [[NSBundle mainBundle] URLForResource:@"motiontrackercontactmediumhigh" withExtension:@"aiff"];
    NSError *error7 = nil;
    myEngine.motionTrackerMediumHigh = [[AVAudioPlayer alloc] initWithContentsOfURL:url7 error:&error7];
    
    [myEngine.motionTrackerMediumHigh setNumberOfLoops:-1];
    
    [myEngine.motionTrackerMediumHigh setVolume:.75];
    
    [myEngine.motionTrackerMediumHigh prepareToPlay];
    
    NSURL *url8 = [[NSBundle mainBundle] URLForResource:@"motiontrackercontacthigh" withExtension:@"aiff"];
    NSError *error8 = nil;
    myEngine.motionTrackerHigh = [[AVAudioPlayer alloc] initWithContentsOfURL:url8 error:&error8];
    
    [myEngine.motionTrackerHigh setNumberOfLoops:-1];
    
    [myEngine.motionTrackerHigh setVolume:.75];
    
    [myEngine.motionTrackerHigh prepareToPlay];
    
    NSURL *url9 = [[NSBundle mainBundle] URLForResource:@"smartgunsoundeffect" withExtension:@"aiff"];
    NSError *error9 = nil;
    myEngine.smartGunSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url9 error:&error9];
    
    [myEngine.smartGunSound setNumberOfLoops:-1];
    
    [myEngine.smartGunSound setVolume:1];
    
    [myEngine.smartGunSound prepareToPlay];
    
    NSURL *url10 = [[NSBundle mainBundle] URLForResource:@"musiconeending" withExtension:@"aiff"];
    NSError *error10 = nil;
    myEngine.sadMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url10 error:&error10];
    
    [myEngine.sadMusic setNumberOfLoops:-1];
    
    [myEngine.sadMusic setVolume:.75];
    
    [myEngine.sadMusic prepareToPlay];
}

@end
