//
//  GameViewController.m
//  ColonialMarine
//
//  Created by  on 4/29/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
    BOOL isAnimatingText;
    
    NSString *earthBackground, *colonyBackground;
    
    UIViewController *cutsceneView;
}
@property (weak, nonatomic) IBOutlet UITextField *firstNameBox;
@property (weak, nonatomic) IBOutlet UITextField *lastNameBox;
@property (weak, nonatomic) IBOutlet UITextView *backgroundPreview;
@property (weak, nonatomic) IBOutlet UIStepper *ageChanger;
@property (weak, nonatomic) IBOutlet UISegmentedControl *hairColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *skinColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundType;
@property (weak, nonatomic) IBOutlet UILabel *backgroundArea;
@property (strong, nonatomic)AVAudioPlayer * clickSound;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

- (IBAction)ageStepper:(id)sender;
- (IBAction)hairColorType:(UISegmentedControl *)sender;
- (IBAction)skinColorType:(UISegmentedControl *)sender;
- (IBAction)backgroundType:(UISegmentedControl *)sender;
- (IBAction)continueToGame:(id)sender;




@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Engine * myEngine = [Engine sharedInstance];
    myEngine.skinColor = @"White";
    myEngine.charHairColor = @"Blonde";
    myEngine.charBackground = @"Earth";
    
    myEngine.choicesMade = 0;
    
    isAnimatingText = NO;
    
    earthBackground = @"Raised in an orphanage, you grew up without knowing either of your parents. As time went on, the orphange had financial troubles and was forced to make budget cuts. Needing food and money, you turned to a life of crime to get these things. After being arrested, you were offered an ultimatum; Either join the military or go to prison.";
    colonyBackground = @"Raised on a Wayland Yutani colony, you spent your life surrounded by the mining industry. Your parents were both prospectors and while they tried to get you into the family business, you refused. You wanted something different with your life, so you decided to travel off of the desolate world, and fly to an Earth-like planet where you would join the Colonial Marine Corps.";
    
    myEngine.endingOne = NO;
    myEngine.endingOneGood = NO;
    myEngine.endingOneBad = NO;
    myEngine.endingTwo = NO;
    myEngine.endingTwoGood = NO;
    myEngine.endingTwoBad = NO;
    
    
    cutsceneView = [self.storyboard instantiateViewControllerWithIdentifier:@"CutsceneViewController"];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    
    
}
-(void)playTick
{
    
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"repeataudio" withExtension:@"aiff"];
    NSError *error2 = nil;
    self.clickSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:&error2];
    [self.clickSound setNumberOfLoops:-1];
    
    [self.clickSound play];
}
- (IBAction)ageStepper:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.charAge = self.ageChanger.value;
}
-(void)typeText:(NSString*)textToType labelToUse:(UILabel *)label
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0),
                   ^{
                       [self animateLabelShowText:textToType labelToUse:label characterDelay:.003];
                   });
    
    
    
}
- (void)animateLabelShowText:(NSString*)newText labelToUse:(UILabel *)labelToUse characterDelay:(NSTimeInterval)delay
{
    [self.backgroundType setEnabled:NO];
   // [self.backgroundType setAlpha:.3];
    
    for (int i=0; i<newText.length; i++)
    {
        [self playTick];
        isAnimatingText = YES;
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [labelToUse setText:[NSString stringWithFormat:@"%@%C", labelToUse.text, [newText characterAtIndex:i]]];
                       });
       
        [NSThread sleepForTimeInterval:delay];
        
    }
    [self.clickSound stop];
    [self.backgroundType setEnabled:YES];
    // [self.backgroundType setAlpha:1.0];
    isAnimatingText = NO;
}
- (IBAction)hairColorType:(UISegmentedControl *)sender {
    Engine * myEngine = [Engine sharedInstance];
    switch (sender.selectedSegmentIndex) {
        case 0:
            myEngine.charHairColor = @"Blonde";
            break;
        case 1:
            myEngine.charHairColor = @"Brown";
            break;
        case 2:
            myEngine.charHairColor = @"Black";
            break;
            
        default:
            break;
    }
}

- (IBAction)skinColorType:(UISegmentedControl *)sender {
    Engine * myEngine = [Engine sharedInstance];
    switch (sender.selectedSegmentIndex) {
        case 0:
            myEngine.skinColor = @"White";
            break;
        case 1:
            myEngine.skinColor = @"Asian";
            break;
        case 2:
            myEngine.skinColor = @"Black";
            break;
            
        default:
            break;
    }
}
-(void)disableButton
{
    
    
    
    
    
}

- (IBAction)backgroundType:(UISegmentedControl *)sender {
   
    if(!isAnimatingText)
    {
    Engine * myEngine = [Engine sharedInstance];
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            
            [self.backgroundArea setText:@""];
            myEngine.charBackground = @"Earth";
            [self.backgroundArea setText:earthBackground];
            //[self typeText:earthBackground labelToUse:self.backgroundArea];
            break;
        }
        case 1:
        {
           
            [self.backgroundArea setText:@""];
            myEngine.charBackground = @"Colony";
            [self.backgroundArea setText:colonyBackground];
            
            break;
        }
        default:
        {
            break;
        }
        }
    }//end of isAnimating Text
}

- (IBAction)continueToGame:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.firstName = self.firstNameBox.text;
    myEngine.lastName = self.lastNameBox.text;
    if ([myEngine.firstName  isEqual: @""] && [myEngine.lastName   isEqual: @""]){
        UIAlertView *informationNotFilled = [[UIAlertView alloc] initWithTitle:@"<...Error...>" message:@"You have not filled in your first and last name." delegate:self cancelButtonTitle:@"Okay." otherButtonTitles:nil];
        [informationNotFilled show];
        
    } else {
        [self.backgroundArea.layer removeAllAnimations];

        [self.navigationController pushViewController:cutsceneView animated:YES];
    }
}
@end

