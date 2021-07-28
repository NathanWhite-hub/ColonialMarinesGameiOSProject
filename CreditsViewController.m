//
//  CreditsViewController.m
//  ColonialMarine
//
//  Created by  on 5/28/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()
{
    NSString *credits;
    BOOL userIsGoingNext;
    UIViewController *mainMenu;
}

@property (weak, nonatomic) IBOutlet UILabel *creditsText;
@property (strong, nonatomic)AVAudioPlayer * clickSound;
- (IBAction)backToMenu:(id)sender;

@end

@implementation CreditsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    credits = @"A Game by Nathan White.\n\n\nA special thanks to my iOS programming class, which without, this game would have never been made.\n\nA special thanks to Mr. Franz for helping me in making this game.\n\nA special thanks to my family and parents for continuing to support my dreams to work in the IT industry.\n\nAll References and Images from the Aliens trilogy used in this game belong to 20th Century Fox\n\n\n'Do or die, Semper Fi.'";
    
    mainMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"MainMenuViewController"];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self typeText:credits labelToUse:self.creditsText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)playTick
{
    
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"repeataudio" withExtension:@"aiff"];
    NSError *error2 = nil;
    self.clickSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
    [self.clickSound setNumberOfLoops:-1];
    
    [self.clickSound play];
}

-(void)typeText:(NSString*)textToType labelToUse:(UILabel *)label
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0),
                   ^{
                       [self animateLabelShowText:textToType labelToUse:label characterDelay:.03];
                   });
    
}
- (void)animateLabelShowText:(NSString*)newText labelToUse:(UILabel *)labelToUse characterDelay:(NSTimeInterval)delay
{
    
    for (int i=0; i<newText.length; i++)
    {
        
        if (!userIsGoingNext) {
            [self playTick];
            
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               [labelToUse setText:[NSString stringWithFormat:@"%@%C", labelToUse.text, [newText characterAtIndex:i]]];
                           });
            
            [NSThread sleepForTimeInterval:delay];
        }
    }
    [self.clickSound stop];
}

- (IBAction)backToMenu:(id)sender {
    userIsGoingNext = YES;
    [self.navigationController pushViewController:mainMenu animated:YES];
}
@end
