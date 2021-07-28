//
//  CutsceneViewController.m
//  ColonialMarine
//
//  Created by  on 5/6/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "CutsceneViewController.h"

@interface CutsceneViewController ()
{
    
    NSString *earthBackground, *colonyBackground, *basicTraining, *hyperSleepCutscene, *hyperSleepCutscene2, *hyperSleepCutscene3, *hyperSleepCutscene4, *endingOneBadText, *endingOneGoodText, *endingTwoBadText, *endingTwoGoodText;
    
    BOOL userIsGoingNext;
    
    UIViewController *mainGameView;
    UIImage *hyperSleepPodImage;
    UIViewController *creditsView;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *cutsceneImage;
@property (strong, nonatomic)AVAudioPlayer * clickSound;
@property (weak, nonatomic) IBOutlet UILabel *cutsceneText;

- (IBAction)nextButton:(id)sender;

@end

@implementation CutsceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Engine * myEngine = [Engine sharedInstance];
    
    earthBackground = @"The year is 2181 and Earth is a bustling place of activity. As a young child you were abandoned by your mother. You never knew her and most likely never will. Your father? Nobody knows and the only comfort to you as a child came in the form of the orphanage owner. Mrs. Abbey was a kind older woman whose husband had passed away seven years prior to your birth. The streets of Chicago were tough and for an orphaned child, it was the perfect catalyst for a future criminal.\n\nMrs. Abbey insured that every child in the orphanage was loved and cared for though this was no easy task. Financial issues took a toll on the orphanage, causing some of the older children to just merely leave to begin their life on the streets. You stayed for only a while though you soon left as well. Living as a homeless child was difficult, as implied, but you managed. You did small odd jobs for people and with the money you got, you were able to feed yourself. However, no one can spend the rest of their lives doing small tasks for people in return for a couple of credits. Soon, you turned to crime as your means of a livelihood.\n\nArmed with a toy gun, you began robbing people on the streets just for a couple of credits to get dinner that night. Were you proud of this? Did it bother you? It is hard to say. This was no way for a young man to live, especially one who was 19. One day you robbed the wrong person and found yourself on the ground.";
    
    colonyBackground = @"The year is 2181 and you and your family reside in a small colony located in Zeta Reticuli, a wide binary star system. As a child, you had a simple life. Your father Jonathan <LASTNAME> was a prospector for the Wayland-Yutani corporation, a corporation you grew up with your entire life. Everywhere you went as a child all you saw were Wayland-Yutani logos and posters, they did own the colony after all. You mother Jennifer <LASTNAME> was also a prospector who worked often with your father. Your home was LV-953, a rocky and desolate planet the was only habitable due to the atmospheric processor, also ran and manufactured by Wayland-Yutani.\n\nFrom adolescence you began working as a prospector with your parents, following family tradition. However, you seemed to not really care for the work of a prospector working on a windy and bleak planet, you wanted something different. The United States Colonial Marine Corps had made a visit to your high school and spoke of what they did. Seeing this man and woman in full uniform before you seemed to spark something in you. Your parents were not happy to hear that you wished to join the Corps, however being that you had just turned 18, there was little they could do.\n\nA single grey cargo shuttle took you from the desolate planet you called home for your entire life. You were flown to a nearby colonized planet that was much more Earth like than LV-953. You stepped off the shuttle and into the docking area as you glanced around at the tall skyscrapers in wonder. You made your way through the city and to a nearby Marine Recruiting Center. You walked in the recruiting center a civilian and stepped out a grunt in the USCM. It has been two weeks since that moment and now you find yourself on an old bus in the middle of nowhere.";
    
    basicTraining = @"Basic training was difficult and vigorious, but you pulled through. After a long six weeks, you were finally made a Private in the United States Colonial Marine Corps. What would lay ahead for you? Who knows. You met many people in boot camp, some of which will be assigned to your new unit: Easy company under the 501st Marine Assault Unit. Welcome to the Corps, Private.";
    
    hyperSleepCutscene = @"You make your way across the hypersleep bay before talking a seat along the edge of the pod. You carefully climb into the bed before the door slowly closes over top of you. The sounds of marines laughing and talking slowly fade around you as your vision gradually goes dark.";
    
    hyperSleepCutscene2 = @"Darkness is all that you see though it feels as if it goes by in seconds. The soft hum of the pod door lifting up wakes you, causing your eyes to flicker open. You slowly sit up and rub your neck as you gaze around at the groaning and yawning marines. Within moments the Master Sergeant is already up and about. After getting up and changing into your BDUs you realize that what seemed like seconds was actually three weeks.\n\nYou report to breakfast and quickly scarf up the food (if it can be called that) before the Lieutenant and Master Sergeant charge into the room. You are all told to report to the hanger for briefing. Once there with the other 25 or so marines, you notice how quiet the hanger compared to last time. There are no more powerloaders and equipment being moved around.\n\nYou are told about a colony that went quiet along the outer rim. With the ghost stories that were passed around about the USS Sulaco, some of the marines seem a bit worried, though they continue to keep the tough guy attitude up. After brief you are told you are already in orbit around the planet and will be commencing a combat drop in 30 minutes.";
    
    hyperSleepCutscene3 = @"You snap up and follow the other marines into the locker room where you begin strapping on your M3 Pattern Personal Armor and your other pieces of gear. You grab an M41A Pulse Rifle from the armory and shift your gaze over to the mirror. You really do look like 'The ultimate Badass'. After gearing up, you run out to the APC and line up along the wall with your fellow marines. Armed to the teeth with Three Smartgunners and three rifleteams, you are set to roll out. Master Sergeant Evans makes his way down the line before shooting you all a wide grin and a nod.\n\nMaster Sergeant Evans: We are going to get some, sweethearts. We are going to divide and we are going to conquere. Oh yeah! That's what we're gunna do!\n\nHe says before walking over to the APC and opening the door. You all pile into the APC before taking a seat. You hear the rumble of the engine as you drive forward and into the UD-4L Dropship. After driving up the ramp and locking in, the dropship prepares to launch.";
    
    hyperSleepCutscene4 = @"You suddenly feel a jerk as the dropship is sent into a freefall. The ship shakes and shutters as it travels through the planet's atmosphere. Once through the atmosphere the dropship stabilizes and begins flying smoothly. It is only a few moments before the drop ship hits the ground which causes the dropship's ramp to drop and the APC to drive out at a fast speed. A few seconds is all the dropship is on the ground for before it flies off and into the air.";
    
    endingOneBadText = [NSString stringWithFormat:@"You gaze forward as you hear the squealing in front of you. You slowly raise your gun as the lights flicker, exposing the aliens for a moment before making them disappear in a shadow of darkness. As they come into view finally you begin releasing a spray of bullets towards the aliens. One after another they fall, but they just keep coming. You begin firing grenades from the underbarrel of your rifle, causing the building to shake violent. A few thoughts come to your mind in that fury of rage and self sacrafice. Your family, your childhood, and the past choices you made. Regrets? A few, but this made up for them. Eventually the Silver creatures overwhelm you and you slide your hand down to your duty belt before tugging a grenade free. As an aliens jumps on top of you it stares menacingly into your eyes, but you stare menacingly back. A stare that would put the fear of god into most men. A slow beep escapes the grenade and the alien's jaws open wide to consume it's dinner. You bring the grenade close to your chest before a loud boom is let out. Self sacrafice is what you did that day. You gave your life for your fellow marines, and in war, the only thing that matters is the fella next to you.\n\nPrivate %@ %@ was recognized for their heroism and self sacrafice. Master Sergeant Evans was presented with the honor of giving you a post-mortem Silver Star for your heroism. The entire colony was later found to be killed and was authorized to be nuked by the United Space Command. Without your and Norrington's sacrafice, it is unlikely any marine would have made it off of the planet. You did well, kid. Thank you for playing.", myEngine.firstName, myEngine.lastName];
    
    endingOneGoodText = [NSString stringWithFormat:@"You gaze forward as you hear the squealing in front of you. You slowly raise your gun as the lights flicker, exposing the aliens for a moment before making them disappear in a shadow of darkness. As they come into view finally you begin releasing a spray of bullets towards the aliens. One after another they fall, but they just keep coming. You begin firing grenades from the underbarrel of your rifle, causing the building to shake violent. A few thoughts come to your mind in that fury of rage and self sacrafice. Your family, your childhood, and the past choices you made. You lived your life selflessly and tried to be a good individual when you could; something most people can't do in their entire life time. There is honor in that. Eventually the Silver creatures overwhelm you and you slide your hand down to your duty belt before tugging a grenade free. As an aliens jumps on top of you it stares menacingly into your eyes, but you stare menacingly back. A stare that would put the fear of god into most men. A slow beep escapes the grenade and the alien's jaws open wide to consume it's dinner. You bring the grenade close to your chest before a loud boom is let out. Self sacrafice is what you did that day. You gave your life for your fellow marines, and in war, the only thing that matters is the fella next to you.\n\nPrivate %@ %@ was recognized for their heroism and self sacrafice. Emma eventually went on to honor you personally at your funeral, speaking about the type of individual you were. Master Sergeant Evans was presented with the honor of giving you a post-mortem Silver Star for your heroism. The entire colony was later found to be killed and was authorized to be nuked by the United Space Command. Without your and Norrington's sacrafice, it is unlikely any marine would have made it off of the planet. You did well, kid. Thank you for playing.", myEngine.firstName, myEngine.lastName];
    
    endingTwoBadText = [NSString stringWithFormat:@"You run forward, your feet practically rocketing you out of there as a terrified look comes across your face. You leave your platoon behind. Your platoon watches on in shock as you just leave them behind and soon enough, you hear their screams along with gun fire. As you sprint past a vent opening, a silvery alien leans out of the grate and grabs your leg tightly, causing you to fall forward and slam into the ground. Before you know it, you're being pulled into the vent, and your cries for help are falling on deaf ears. The alien begins tearing into your flesh as you yelp out. A few members of 2nd platoon sprint right past you and don't even stop to help you. You are pulled away to your death, never to be seen again. Private %@ %@. You are remember as a deserter and a traitor who left his friends behind. Your name is soon forgotten by those who knew you. Emma and Master Sergeant Evans quickly forgot about you and are both lucky to have made it off of the planet. The entire company was nearly wiped out, nearly, luckily. Thank you for playing.", myEngine.firstName, myEngine.lastName];
    
  //  hyperSleepPodImage = [UIImage imageNamed:@"hypersleeppodsimage"];
    
    mainGameView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainGameViewController"];
    
    creditsView = [self.storyboard instantiateViewControllerWithIdentifier:@"CreditsViewController"];
    
    userIsGoingNext = NO;
    
  }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    Engine * myEngine = [Engine sharedInstance];
    
    
    if (myEngine.choicesMade == 0) {
        if ([myEngine.charBackground  isEqual: @"Earth"]) {
            [self typeText:earthBackground labelToUse:self.cutsceneText];
        } else if ([myEngine.charBackground  isEqual: @"Colony"]){
            colonyBackground = [colonyBackground stringByReplacingOccurrencesOfString:@"<LASTNAME>" withString:myEngine.lastName];
            [self typeText:colonyBackground labelToUse:self.cutsceneText];
        }
    }else if (myEngine.choicesMade == 6){
        
        [self typeText:basicTraining labelToUse:self.cutsceneText];
        
        myEngine.choicesMade++;
        
    }else if (myEngine.choicesMade == 12){
        [self.cutsceneImage setImage:[UIImage imageNamed:@"hypersleeppodsimage.png"]];
        [self.cutsceneText setText:hyperSleepCutscene];
        
        myEngine.choicesMade++;
        
    }else if (myEngine.endingOne && myEngine.endingOneBad){
        [myEngine.gameMusic stop];
        [myEngine.sadMusic play];
        [self typeText:endingOneBadText labelToUse:self.cutsceneText];
        
    }else if (myEngine.endingOne && myEngine.endingOneGood){
        [myEngine.gameMusic stop];
        [myEngine.sadMusic play];
        [self typeText:endingOneGoodText labelToUse:self.cutsceneText];
        
    }else if (myEngine.endingTwo){
        [myEngine.gameMusic stop];
        [myEngine.sadMusic play];
        [self typeText:endingTwoBadText labelToUse:self.cutsceneText];
        
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
                           [self animateLabelShowText:textToType labelToUse:label characterDelay:.003];
                       });
    
}
- (void)animateLabelShowText:(NSString*)newText labelToUse:(UILabel *)labelToUse characterDelay:(NSTimeInterval)delay
{
   // Engine * myEngine = [Engine sharedInstance];
    
    
    
   // myEngine.isAnimatingTextMaster = YES;
    
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
   // myEngine.isAnimatingTextMaster = NO;
}


- (IBAction)nextButton:(id)sender {
    userIsGoingNext = YES;
    Engine * myEngine = [Engine sharedInstance];
    if (myEngine.choicesMade == 0) {
        [self.navigationController pushViewController:mainGameView animated:YES];
    } else if (myEngine.choicesMade == 7){
        [self.navigationController pushViewController:mainGameView animated:YES];
    } else if (myEngine.choicesMade == 13){
        [self.cutsceneText setText:hyperSleepCutscene2];
        userIsGoingNext = NO;
        [self.cutsceneImage setAlpha:0];
        myEngine.choicesMade++;
        
    }else if (myEngine.choicesMade == 14){
        [self.cutsceneText setText:hyperSleepCutscene3];
        userIsGoingNext = NO;
        
        myEngine.choicesMade++;
    }else if (myEngine.choicesMade == 15){
        [myEngine.combatDropMusic play];
        [self.cutsceneText setText:hyperSleepCutscene4];
        userIsGoingNext = NO;
        
        myEngine.choicesMade++;
    } else if (myEngine.choicesMade == 16){
        [self doCombatDropMusicVolumeFade];
        [self.navigationController pushViewController:mainGameView animated:YES];
    } else if (myEngine.endingOne || myEngine.endingTwo){
        [self.navigationController pushViewController:creditsView animated:YES];
    }
}

-(void)doCombatDropMusicVolumeFade
{
    Engine * myEngine = [Engine sharedInstance];
    if (myEngine.combatDropMusic.volume > 0.1) {
        myEngine.combatDropMusic.volume = myEngine.combatDropMusic.volume - 0.1;
        [self performSelector:@selector(doCombatDropMusicVolumeFade) withObject:nil afterDelay:0.1];
    } else {
        // Stop and get the sound ready for playing again
        [myEngine.combatDropMusic stop];
        myEngine.combatDropMusic.currentTime = 0;
        [myEngine.combatDropMusic prepareToPlay];
        myEngine.combatDropMusic.volume = 1.0;
    }
}
@end
