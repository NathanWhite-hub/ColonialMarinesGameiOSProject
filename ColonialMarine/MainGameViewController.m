//
//  MainGameViewController.m
//  ColonialMarine
//
//  Created by  on 5/6/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "MainGameViewController.h"

@interface MainGameViewController ()
{
    
    UIViewController *cutsceneView;
    UIImage *drillSergeantImage;
    //UIImage *emmaImage;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *npcImageArea;
@property (weak, nonatomic) IBOutlet UILabel *textArea;
@property (weak, nonatomic) IBOutlet UIButton *dialogOptionOne;
@property (weak, nonatomic) IBOutlet UIButton *dialogOptionTwo;
@property (weak, nonatomic) IBOutlet UIButton *dialogOptionThree;
@property (weak, nonatomic) IBOutlet UIButton *dialogOptionFour;

- (IBAction)optionOneButton:(id)sender;
- (IBAction)optionTwoButton:(id)sender;
- (IBAction)optionThreeButton:(id)sender;
- (IBAction)optionFourButton:(id)sender;

@end

@implementation MainGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Engine * myEngine = [Engine sharedInstance];
    
    cutsceneView = [self.storyboard instantiateViewControllerWithIdentifier:@"CutsceneViewController"];
    [self doMenuMusicVolumeFade];
    
    if (myEngine.choicesMade == 0) {
        self.textArea.text = @"The bus comes to a sudden stop in front of a large concrete building flying the United Americas flag. A large African American man clad in military BDUs steps on board the bus. As his piercing gaze shifts over you and the new recruits his expression changes to that of a grimace.\n\nGunnery Sergeant Hurtman: Get off the bus, maggots! Lets move! Go, go go!";
        
        [self.dialogOptionOne setTitle: @"1.) He said move! So move!" forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Take your time getting off of the bus, making sure to tread carefully." forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@"3.) Keep sitting. He isn't the boss of you!" forState:UIControlStateNormal];
        
        [self.dialogOptionFour setAlpha:0];
        
        [self.dialogOptionFour setTitle:@"4.)" forState:UIControlStateDisabled];
        
        [myEngine.gameMusic play];
        
        
    } else if (myEngine.choicesMade == 7){
        self.textArea.text = [NSString stringWithFormat:@"After being flown to Fort Bening, you have been shipped out to the USS Requiem where you will be meeting your platoon. After an exhuasting 2 hour travel time, you finally reach the Requiem where it is in orbit above Earth. You carefully make your way down the ramp of the UD-4L dropship. With dufflebag in hand, you make your way over to a larger build caucasian man with a pair of Master Sergeant chevrons on his chest.\n\nThe man watches you as you walk towards him, his intimidating gaze narrowing solely on you. As you reach the man you stop right in front of him before dropping your bags and snapping your right hand up to a salute.\n\nYou: Sir, Private %@ %@ reporting for duty, sir!\nMaster Sergeant Jack Evans: One, don't call me sir. You only call officers sir. You will address me as Master Sergeant. Now, you must be my new rifleman, %@. Welcome to the team. We are going to be moving out at oh-five-hundered, so get your gear packed in and get moving.", myEngine.firstName, myEngine.lastName, myEngine.lastName];
        
        [myEngine.hangerSounds play];
        
        [self.dialogOptionOne setTitle:@"1.) Make your way to barracks." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) 'Yes, sir.' and move to the barracks." forState:UIControlStateNormal];
        
        [self.dialogOptionThree setAlpha:0];
        
        [self.dialogOptionThree setTitle:@"3.)" forState:UIControlStateDisabled];
        
        [self.dialogOptionFour setAlpha:0];
        
        [self.dialogOptionFour setTitle:@"4.)" forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 16){
        [myEngine.gameMusic play];
        self.textArea.text = [NSString stringWithFormat:@"The APC drives towards a large colonial complex and once reaching it, the APC's doors swing open causing all of the marines to spill out into combat positions. The marines aim their guns forward, the Smartgunner taking care to hold in the front. The planet is dusty and dark, but the air is breathable, barely. Master Sergeant Evans shifts his gaze over to you as he points forward to a large metal door which is about the width of a car.\n\nMaster Sergeant Evans: Get it open, %@.", myEngine.lastName];
        
        
        
        [self.dialogOptionOne setTitle:@"1.) Nod and walk forward before hacking into the door." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Walk up and shoot at the door." forState:UIControlStateNormal];
        
        [self.dialogOptionThree setAlpha:0];
        
        [self.dialogOptionThree setTitle:@"3.)" forState:UIControlStateDisabled];
        
        [self.dialogOptionFour setAlpha:0];
        
        [self.dialogOptionFour setTitle:@"4.)" forState:UIControlStateDisabled];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)optionOneButton:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.choicesMade++;
    
    if (myEngine.choicesMade == 1) {
        self.textArea.text = @"Since you rushed off of the bus, you were bumped around like pinball. Good job forgetting your bag on the bus. As you stumble out of the bus you quickly step into line, your shoulders meeting the two young men next to you. Your gaze holds forward as the Drill Sergeant slowly steps down the line, his eyes slowly moving over each individual cadet.\n\nAs he gets to you his gaze narrows, but only for a moment.";
        
        [self.dialogOptionOne setTitle: @"1.) Continue looking forward." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Shift your eyes onto his piercing gaze" forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@"3.) 'What are you looking at?'" forState:UIControlStateNormal];
        
        
    } else if (myEngine.choicesMade == 2) {
        if ([myEngine.charBackground isEqual:@"Earth"]) {
            self.textArea.text = @"Gunnery Sergeant Hurtman: Where are you from, boy?!\n\nYou: Earth, Drill Sergeant!\n\nGunnery Sergeant Hurtman: Earth?! Doing all the easy work while people out in the colonies are working their asses off, for you! You make me sick. I'm going to work you. The Corps will turn you into a man, not some Earth dwelling scum!\n\nThe Drill Sergeant continues making his way down the line, his eyes moving over each individual recruit as he sizes up the fresh meat. Your gaze falls forward as you watch the Drill Sergeant step before the group.\n\nDrill Segeant Jackson: I am Gunnery Sergeant Hurtman, your Senior Drill Instructor! You will only speak when spoken to and the next six weeks will be the most miserable time of your pathetic lives! You will speak when spoken to and you obey every order given to you by a superior. Welcome to the Corps, recruits. Get to your bunks. Dismissed!";
            
            [self.dialogOptionOne setTitle: @"1.) Step out of line and move to your designated barracks." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Continue standing in line." forState:UIControlStateNormal];
            
            [self.dialogOptionThree setTitle:@" " forState:UIControlStateDisabled];
            [self.dialogOptionThree setAlpha:0];
            
            myEngine.gunnerySergeantHurtmanLike++;
        } else if ([myEngine.charBackground isEqual:@"Colony"]){
            self.textArea.text = @"Gunnery Sergeant Hurtman: Where are you from, boy?!\n\nYou: Zeta Reticuli, Drill Sergeant!\n\nGunnery Sergeant Hurtman: A prospector, eh? Well, in the Corps, we don't play with rocks and pickaxes, recruit! So, looks like you're going to have a tough time here.\n\nThe Drill Sergeant continues making his way down the line, his eyes moving over each individual recruit as he sizes up the fresh meat. Your gaze falls forward as you watch the Drill Sergeant step before the group.\n\nDrill Segeant Jackson: I am Gunnery Sergeant Hurtman, your Senior Drill Instructor! You will only speak when spoken to and the next six weeks will be the most miserable time of your pathetic lives! You will speak when spoken to and you obey every order given to you by a superior. Welcome to the Corps, recruits. Get to your bunks. Dismissed!";
            
            [self.dialogOptionOne setTitle: @"1.) Step out of line and move to your designated barracks." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Continue standing in line." forState:UIControlStateNormal];
            
            [self.dialogOptionThree setTitle:@" " forState:UIControlStateDisabled];
            [self.dialogOptionThree setAlpha:0];
            
            myEngine.gunnerySergeantHurtmanLike++;
        }
    } else if (myEngine.choicesMade == 3){
        // CONTINUE WRITING HERE
        if (myEngine.gunnerySergeantHurtmanLike < 0) {
            self.textArea.text = @"You and the rest of your platoon begin making your way to the barracks. The base isn't very large though it is constantly filled with the sound of men and women being drilled rigoriously. You come up on a large green tin looking building with a black 'A-4' painted on the front.\n\n As you step through the door, ten or so individuals enter almost immediately after you before making their way to the various plain and uncomfortable looking beds protruding from the wall. They begin unpacking their dufflebags.\n\nA young looking woman takes the bed next to yours and quickly dumps the contents of her dufflebag along the bed, causing the items inside to be sprawled out along the bed. She shifts her gaze up to you as she sorts her items.\n\nRecruit Emma Bates: That was pretty ballsy back there with the Drill Sergeant. You have guts, but you aren't too smart.\n\nYou: He annoyed me and I didn't feel like I had to answer to him.\n\nRecruit Emma Bates: Don't be stupid here. If you don't listen to him, they will discharge you.\n\nShe offers you a small smile as she extends her hand out to you.\n\nRecruit Emma Bates: Emma Bates, a pleasure to meet you. What's your name?";
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            myEngine.privateEmmaBatesLike--;
            [self.dialogOptionOne setTitle: @"1.) 'Buzz off.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Say your name and shake her hand." forState:UIControlStateNormal];
        } else{
            self.textArea.text = @"You and the rest of your platoon begin making your way to the barracks. The base isn't very large though it is constantly filled with the sound of men and women being drilled rigoriously. You come up on a large green tin looking building with a black 'A-4' painted on the front.\n\n As you step through the door, ten or so individuals enter almost immediately after you before making their way to the various plain and uncomfortable looking beds protruding from the wall. They begin unpacking their dufflebags.\n\nA young looking woman takes the bed next to yours and quickly dumps the contents of her dufflebag along the bed, causing the items inside to be sprawled out along the bed. She shifts her gaze up to you as she sorts her items.\n\nShe offers you a small smile as she extends her hand out to you.\n\nRecruit Emma Bates: Emma Bates, a pleasure to meet you. What's your name?";
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            [self.dialogOptionOne setTitle: @"1.) 'Buzz off.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Say your name and shake her hand." forState:UIControlStateNormal];
        }
    }else if (myEngine.choicesMade == 4){
        
        self.textArea.text = @"Emma lowers her hand as her eyes stare daggers at you. She slowly bends back over to continue her sorting of her items.\n\nRecruit Emma Bates: Right then. You don't have to talk to me anymore.\n\nAfter a few moments of awkward silence the Drill Sergeant charges into the room before blaring his voice across it.\n\nGunnery Sergeant Hurtman: Lets move! PT time, boys and girls.";
        
        [self.dialogOptionOne setTitle: @"1.) Follow the rest of the recruits out to PT." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
        [self.dialogOptionTwo setAlpha:0];
        [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
        [self.npcImageArea setAlpha:1];
        myEngine.privateEmmaBatesLike--;
        myEngine.privateEmmaBatesLike--;
        
    }else if (myEngine.choicesMade == 5){
        myEngine.choicesMade++;
        [self.npcImageArea setAlpha:1];
        [self.navigationController pushViewController:cutsceneView animated:YES];
        
    } else if (myEngine.choicesMade == 8){
        if (myEngine.privateEmmaBatesLike > 0) {
            [myEngine.hangerSounds stop];
            self.textArea.text = [NSString stringWithFormat:@"You snap the salute away before grabbing your bag up and walking off towards the bunk area. As you walk through the hanger you notice the industrial style of the ship interior. Yellow hazard lights flicker along the walls and powerloaders move around the area as they load cargo and organize it. As you make your way into the hall, you notice how it is much more modern looking than they hanger, with the only dark metal being the floor grates below you. The walls are push outward and come together to for the shape of a triangle. You walk to down the hall and into a small room marked, 'Barracks' before moving to one of the beds that doesn't look unkept.\n\nAfter placing your bag along the bed you adjust your MARPAT camo BDUs, which fits snuggly on your body. After you unpack your items and place them in a locker located near your bed before you take a long needed sit on your bed. A soft sigh escapes you as you feel the relief set on you. Ater a few moments, a familiar woman walks in-Emma Bates from bootcamp. With the patch of the 501st Marine Assault Unit donned on her right breast pocket, she shifted her gaze to you before a bright smile lit up her face.\n\nPrivate Emma Bates: %@! How are you?", myEngine.firstName];
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            [self.dialogOptionOne setTitle: @"1.) 'I didn't realize they let girls fight." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Smile and wave." forState:UIControlStateNormal];
        } else if (myEngine.privateEmmaBatesLike <= 0)  {
            [myEngine.hangerSounds stop];
            self.textArea.text = @"You snap the salute away before grabbing your bag up and walking off towards the bunk area. As you walk through the hanger you notice the industrial style of the ship interior. Yellow hazard lights flicker along the walls and powerloaders move around the area as they load cargo and organize it. As you make your way into the hall, you notice how it is much more modern looking than they hanger, with the only dark metal being the floor grates below you. The walls are push outward and come together to for the shape of a triangle. You walk to down the hall and into a small room marked, 'Barracks' before moving to one of the beds that doesn't look unkept.\n\nAfter placing your bag along the bed you adjust your MARPAT camo BDUs, which fits snuggly on your body. After you unpack your items and place them in a locker located near your bed before you take a long needed sit on your bed. A soft sigh escapes you as you feel the relief set on you. Ater a few moments, a familiar woman walks in-Emma Bates from bootcamp. With the patch of the 501st Marine Assault Unit donned on her right breast pocket, she shifted her gaze onto you with a look of resentment.\n\nPrivate Emma Bates: Well, look who it is. How are you?";
            
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            
            [self.dialogOptionOne setTitle: @"1.) 'I didn't realize they let girls fight." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Smile and wave." forState:UIControlStateNormal];
        }
    } else if (myEngine.choicesMade == 9){
        [myEngine.hangerSounds stop];
        if (myEngine.privateEmmaBatesLike > 0) {
            
            self.textArea.text = [NSString stringWithFormat:@"You cross your arms slowly as you narrow your gaze on her. Your own annoyed gaze meeting her's and before you knew it, you were standing up and walking towards her.\nYou: Girls can fight along side real men? That's new. Well, I suppose they must have thought you were a man and let you join the 501st. Makes sense.\nPrivate Emma Bates: Screw you, %@. I don't even want to be here, but now that you're here, I think I'd rather take my chances with the bugs.\nYou: Yeah? You might actually like it here, Bates.", myEngine.lastName];
            
            myEngine.privateEmmaBatesLike--;
            
            [self.dialogOptionOne setTitle: @"1.) 'The Master Sergeant is a tool.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) 'The Master Sergeant is a stand-up guy.'" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:1];
            
            [self.dialogOptionThree setTitle:@"3.) 'At least we are together here.'" forState:UIControlStateNormal];
        } else  {
            self.textArea.text = [NSString stringWithFormat:@"A wide grin forms along your lips as you shift you carefully push up from your bunk. You begin making your way over to Emma, all while your grin holds firm.\nYou: I didn't realize they let girls fight in the 501st.\nPrivate Emma Bates: Oh? Then why are you here, %@?\nEmma said with a bright smirk before offering a high five out to you, which you quickly slap.\nPrivate Emma Bates: What the hell are you doing here, %@?\nYou: I was stationed on the Requiem with the 501st right after basic.\nPrivate Emma Bates: No kidding? Me too. I tried applying for intelligence officer, but they denied my request and sent me down here.\nYou: You might like it here, Emma.", myEngine.firstName, myEngine.firstName];
            
            [self.dialogOptionOne setTitle: @"1.) 'The Master Sergeant is a tool.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) 'The Master Sergeant is a stand-up guy.'" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:1];
            
            [self.dialogOptionThree setTitle:@"3.) 'At least we are together here.'" forState:UIControlStateNormal];
            myEngine.privateEmmaBatesLike++;
        }
    } else if (myEngine.choicesMade == 10){
        if (myEngine.privateEmmaBatesLike > 0) {
            
            self.textArea.text = [NSString stringWithFormat:@"You shrug your shoulders lightly as you roll your shoulders.\nYou: The Master Sergeant is a bit of a stuck up tool. I don't really know how the other troops are, but it is nice to finally be out of basic.\nPrivate Emma Bates: Right, well I met him and he seemed alright. I suppose we will see in time.\nShe offered a small nod of her head before letting out a yawn. After a few minutes, the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent. Emma offers you a small nod before turning and backing out of the bunk.\nPrivate Emma Bates: See you there, %@.", myEngine.firstName];
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        } else  {
            self.textArea.text = [NSString stringWithFormat:@"You shrug your shoulders lightly as you roll your shoulders.\nYou: The Master Sergeant is a bit of a stuck up tool. I don't really know how the other troops are, but it is nice to finally be out of basic.\nPrivate Emma Bates: Takes one to know one.\nShe gritted her teeth lightly at you before turning on her heels and walking away from you. You walked back to your bunk before taking a seat on the bed once again. After a few minutes the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent."];
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        }
    } else if (myEngine.choicesMade == 11){
        
        self.textArea.text = [NSString stringWithFormat:@"You quickly make your way to your dufflebag before digging out the issues sleep wear. After a few minutes of changing your clothing, you are wearing a pair of short dark briefs along with a white t-shirt showing the acronym 'USCM' in dark letters. You make your way out of the barracks and down the hall wear a few other marines are. Along the hall you notice a sign marked 'Hypersleep' with an arrow pointing to a doorway just to the right of it. You make your way into the room where an estimated 24 marines, both men and women, are talking. They all are wearing the same sleep wear as you and you notice Emma speaking with a couple other soldiers. Master Sergeant Evans sits along one of the sleep pods speaking with who can only be assumed is the Lieutenant."];
        
        [self.npcImageArea setAlpha:0];
        
        [self.dialogOptionOne setTitle: @"1.) Walk over to your sleep pod and climb in" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
        
    } else if (myEngine.choicesMade == 12) {
        [self.navigationController pushViewController:cutsceneView animated:YES];
        
    }else if (myEngine.choicesMade == 17) {
        self.textArea.text = [NSString stringWithFormat:@"You run forward towards the door, causing a few other marines in your squad to follow behind. The Master Sergeant gestures forward silently, causing 1st platoon to move forward onto the door. They move into breaching positions as you tug your PDA free from your duty belt. You flip it open before pulling the cord free from the side and plugging it into the door control console. After a few moment, the door swings open, exposing the destroyed interior, though it still resembles a hallway. A couple of marines whistle in amazement at the sight before them before the Master Sergeant motions forward again.\n\nMaster Sergeant Evans: 1st Platoon, move in and secure."];
        
        [self.dialogOptionOne setTitle: @"1.) Proceed inside." forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 18) {
        self.textArea.text = [NSString stringWithFormat:@"Once inside you and your fellow marines begin moving down the hall in a set of two firing lines along each side of the wall. Private Kennedy breaks out his motion tracked as you follow in behind him.\n\nPrivate Kennedy: I have no contacts, Master Sergeant.\n\nHe says over his radio as the two groups continue moving forward. Lance Corporal Amir holds his smartgun forward as he stops, Kennedy stops as well as a soft beep begins to emit from Kennedy's motion tracker.."];
        [myEngine.motionTrackerMedium play];
        [self.dialogOptionOne setTitle: @"1.) 'What is it?'" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) 'Get your ass moving, Amir.'" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 19) {
        self.textArea.text = [NSString stringWithFormat:@"Private Kennedy: Contact; something is moving to our front.\nLance Corporal Amir: What the hell is it?\nPrivate Kennedy: I have no idea.\nPrivate Townsend: There isn't anything to our front. Where is the contact?\n\nThe radio begins to Echo as Lieutenant Shilling's voice comes over.\n\nLieutenant Shilling: Squad one, SITREP, over.\nCorporal Jaber: We have something on the motion tracker, but we can't see it. We don't know what it is, over. Gleghorn, reinforce Amir up front.\nPrivate First Class Gleghorn: Copy that, Corporal.\n\nGleghorn moves forward before moving next to Amir, his gun now raising fully and his finger sliding down onto the trigger."];
        [myEngine.motionTrackerMedium stop];
        [myEngine.motionTrackerMediumHigh play];
        [self.dialogOptionOne setTitle: @"1.) Bring your weapon up" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    } else if (myEngine.choicesMade == 20){
        [myEngine.motionTrackerMediumHigh stop];
        [myEngine.motionTrackerHigh play];
        self.textArea.text = [NSString stringWithFormat:@"You swing your Pulse Rifle up as your gaze narrows forward. As the motion tracker beeps louder and high it seems other marines around you raise their guns and prepare for contact.\n\nCorporal Jaber: Guns up! Defensive positions! Gleghorn, Townsend, Kennedy, %@, move up and clear it!\nAll four of you move into a square formation as you begin moving forward slowly. As you move up on a door all of you move around the doorway into breaching positions.", myEngine.lastName];
        [self.dialogOptionOne setTitle: @"1.) Move in" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 21){
        [myEngine.motionTrackerHigh stop];
        self.textArea.text = [NSString stringWithFormat:@"Townsend leans back against the wall before driving his foot against the doorway, causing the door to swing open with a loud bang. Townsend quickly clears the way as all three of you push into the room, guns raises. As you push into the room, a man no more than 40 is bound to the wall by a greyish material that looks to be organic. The man is pale and looks malnourished. His eyes snap open as you breach the room, his gaze holding on you with wide eyes.\n\nCivilian: K-Kill... m-me...\n\nYou start to tense up as this situation unfolds before you. Kennedy moves forward and begins attempting to pull the material off of him.\n\nPrivate Kennedy: You're going to be fine, sir. I need you to hang in there. Townsend, move back to Corporal Jaber and tell him what is going on here!\n\nTownsend nods before taking off down the hallway. Within a few seconds the man begins to cry out in pain as his chest expands and contracts.\n\nCivilian: Kill me! Kill me! Please!\n\nAfter a few seconds of convulstion, a small worm like creature burrows out of the man's chest, spraying blood and other liquids onto you and your fellow marines."];
        
        [self.dialogOptionOne setTitle: @"1.) Shoot into the man's chest cavity, and more specifically at the creature" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) Run away." forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 22){
        [myEngine.motionTrackerHigh stop];
        self.textArea.text = [NSString stringWithFormat:@"You raise your Pulse Rifle and begin firing rounds into the man, causing the small alien to be blown away. The blood of the alien sprays into the face of Kennedy, causing him to let out a scream as steam simmers from his face. Kennedy runs out of the room, gripping his face tightly. You quickly turn and give chase though as you're following him a large silvery creature slides out of a vent above. Kennedy runs right into his arms and is scooped up before being pulled into the vent.\n\nYou turn on your heels and take off running. As you run down the hall you feel arms slip around you. As you look up, you come face to face with a silvery alien whos jaws are currently opening. Inside of it's mouth is... a small mouth? Looks like its game over, man."];
        
        [self.dialogOptionOne setTitle: @"1.) Fire up into the Alien" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) Try to Shake free" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 23){
        self.textArea.text = [NSString stringWithFormat:@"You bring your Pulse Rifle up and fire rounds into the alien above you causing it's blood to spray along your face. A powerful stinging sensation fills your eyes and face as the acid burns through your skin. You drop down before slowly standing up and falling over onto your side. You look up and can barely see the platoon in the distance, surrounded by Aliens and being ripped to pieces, their screams and cries of pain filling your ear drums. You crawl towards a hole in the floor grate before dropping down into the water below. You look around, it is a dark sewer system."];
        
        [self.dialogOptionOne setTitle: @"1.) Walk down the Sewer" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 24){
        self.textArea.text = [NSString stringWithFormat:@"After walking down the sewer, you feel exhausted and shook up from what just happened. Where is the rest of your company? Where are your fellow marines? Are you the last one left? All of these were questions that seemed to run through your mind. As you are walking through the sewers you hear footsteps above before looking upwards. Above you, you see a squad of marines clearing the hall. You call out to them and they quickly look down.\n\nMaster Sergeant Evans: %@? Is that you?!\nYou: Yeah! I'm hurt and I think my platoon is gone!\nMaster Sergeant Evans: Don't worry about that, son. Someone get me a damn torch and cut this floor open!\n\nAfter a few moment, the marines tear a small hole in the floor before lowering a rope down to you. You slowly climb up the rope though it is no easy task for the condition you're in. The marines pull you up onto the floor before sealing the hole closed.\n\nMaster Sergeant Evans: What happened, son?", myEngine.lastName];
        
        [self.dialogOptionOne setTitle: @"1.) 'They were everywhere!'" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) An alien came out of a guys chest and I retreated" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 25){
        self.textArea.text = [NSString stringWithFormat:@"The flashbacks of what happen begin to hit you again.\n\nMaster Sergeant Evans: This is Platoon 2, over. We have secured a sole survivor from platoon 1, break. We are falling back onto your position for exfil, over.\n\nYou release a soft groan as the pain of your face hits.\n\nYou: They came out of no where and ripped us apart. Kennedy... Jaber... Gleghorn.. Townsend... I... They are all gone, Master Sergeant.\n\nThe Master Sergeant nods softly as he attempts to help you up.\nMaster Sergeant Evans: Rest easy, son. We are getting you out of here."];
        
        [self.dialogOptionOne setTitle: @"1.) Get helped up by Evans" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) Refuse the help and stand up yourself" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 26){
        self.textArea.text = [NSString stringWithFormat:@"You slowly stand up with the assistance of Evans. You hold on him for support as the sound of a motion tracker begins to beep.\n\nPrivate First Class Gavrilvich: Contacts! Multiple! I count four... no... six... eight... fifteen! There are more! They are all around us!\n\nThe Master Sergeant swings his Pulse Rifle up as you stand on your own. He grips his radio tightly as he begins speaking into it.\n\nMaster Sergeant Evans: Get the evac ready, we are going to be coming in hot, over!\n\n The platoon begins moving forward."];
        [myEngine.motionTrackerSlow play];
        [self.dialogOptionOne setTitle: @"1.) Follow the platoon, and stick close to Master Sergeant Evans" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 27){
        self.textArea.text = [NSString stringWithFormat:@"As the platoon walks forward, the beeping becomes higher pitched and increases in speed. The marines continue walking back, but you are clearly slowing them down.\n\nMaster Sergeant Evans: Sir, I need a status update on that dropship!\nMaster Sergeant Evans: Copy, out! Keep moving, marines!"];
        [myEngine.motionTrackerSlow stop];
        [myEngine.motionTrackerMedium play];
        [self.dialogOptionOne setTitle: @"1.) Continue moving forward" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 28){
        self.textArea.text = [NSString stringWithFormat:@"The beeping only increases as you begin to hear the sound of a squealing animal behind you. As you gaze back, you see a terrifying amount of the silvery creatures behind you. One of the platoon smartgunners spins around and holds his position firmly as he opens up with the smartgun. The aliens begin to explode, causing their acid to spray along the walls, but even with a lot of them dropping, the silvery creatures continue to push forward towards the smartgunner."];
        [myEngine.motionTrackerMedium stop];
        [myEngine.motionTrackerMediumHigh play];
        [myEngine.smartGunSound play];
        [self.dialogOptionOne setTitle: @"1.) Run faster" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 29){
        self.textArea.text = [NSString stringWithFormat:@"The sound of the Smartgun begins to lower in the distance as the platoon continues moving towards the exit. A few lose aliens attempts to block off the platoon from continuing forward, but they are quickly dispatched of with a pair of Pulse Rifles in the front. The sound of the motion tracker is at full pitch as the screen shows the entire platoon surrounded. Master Sergeant Evans merely pulls back the charging handle of his Pulse Rifle as he preps for contacts."];
        [myEngine.motionTrackerMediumHigh stop];
        [myEngine.motionTrackerHigh play];
        [myEngine.smartGunSound setVolume:0.75];
        [self.dialogOptionOne setTitle: @"1.) 'You guys go ahead, I'll stay behind.'" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle: @"1.) Take off running and leave the platoon behind" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 30){
        self.textArea.text = [NSString stringWithFormat:@"You slowly raise your head to the Master Sergeant as you place your hand on his shoulder.\n\nYou: I'm dead weight, Sergeant. Get your platoon out of here.\n\nMaster Sergeant Evans: Are you insane, son? We aren't leaving you.\n\nYou: You left Norrington back there on the smartgun. He saved our lives and now I'll buy you some time. Go.\n\nEvans stares at you for a moment before pushing his Pulse Rifle into your chest.\n\nMaster Sergeant Evans: Give em' hell, %@. Make then pay.\n\nThe marines around you gaze at you with a gaze of respect as you turn around towards the direction from which you came. They all give you a nod of respect before Evans motions forward and the platoon takes off running to the exit.", myEngine.firstName];
        [myEngine.motionTrackerHigh stop];
        [myEngine.smartGunSound stop];
        myEngine.endingOne = YES;
        [self.dialogOptionOne setTitle: @"1.) Give them hell" forState:UIControlStateNormal];
    } else if (myEngine.endingOne && myEngine.renegade >= 1){
        myEngine.endingOneBad = YES;
        [self.navigationController pushViewController:cutsceneView animated:YES];
    }else if (myEngine.endingOne && myEngine.renegade <= 0){
        myEngine.endingOneGood = YES;
        [self.navigationController pushViewController:cutsceneView animated:YES];
    }
}

- (IBAction)optionTwoButton:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.choicesMade++;
    
    if (myEngine.choicesMade == 1) {
        self.textArea.text = @"Taking your time seemed to prove effective. You make sure to grab your bag from the overhead compartment before stumbling from the bus with the rest of the recruits. As you stumble out you quickly drop your bag to your side before shifting your gaze upwards and stepping into line, shoulder to shoulder with the two young men next to you.\n\nYour gaze holds forward as the Drill Sergeant slowly steps down the line, his eyes slowly moving over each individual cadet.\n\nAs he gets to you his gaze narrows, but only for a moment.";
        
        [self.dialogOptionOne setTitle: @"1.) Continue looking forward." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Shift your eyes onto his piercing gaze" forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@"3.) 'What are you looking at?'" forState:UIControlStateNormal];
        
        myEngine.patience++;
        myEngine.gunnerySergeantHurtmanLike++;
    } else if (myEngine.choicesMade == 2) {
        self.textArea.text = @"The Drill Sergeant narrows his gaze even further before gritting his teeth lightly, his eyes opening widely.\n\nGunnery Sergeant Hurtman: You eyeballin' me, boy?!\n\nYou quickly shift your gaze away before yelling: 'No, Drill Sergeant!' The Drill Sergeant stares for a moment more, his lips curling his mustache lightly.\n\nGunnery Sergeant Hurtman: Good. \n\nThe Drill Sergeant continues making his way down the line, his eyes moving over each individual recruit as he sizes up the fresh meat. Your gaze falls forward as you watch the Drill Sergeant step before the group.\n\nDrill Segeant Jackson: I am Gunnery Sergeant Hurtman, your Senior Drill Instructor! You will only speak when spoken to and the next six weeks will be the most miserable time of your pathetic lives! You will speak when spoken to and you obey every order given to you by a superior. Welcome to the Corps, recruits. Get to your bunks. Dismissed!";
        
        [self.dialogOptionOne setTitle: @"1.) Step out of line and move to your designated barracks." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Continue standing in line." forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@" " forState:UIControlStateDisabled];
        [self.dialogOptionThree setAlpha:0];
        
        myEngine.patience++;
    } else if (myEngine.choicesMade == 3){
        self.textArea.text = @"The Drill Sergeant Narrows his Gaze onto you. He stares once again for a few moments before shouting at you. He makes his way over to you, his jet black boots smashing the blades of grass beneath his feet.\n\nGunnery Sergeant Hurtman: What is your major Malfunction numb-nuts?! You had best unscrew yourself or I will rip off your head and deficate down your neck!\n\nThe Drill Sergeant practically presses his chest against your own before he points to the barracks. Being that you aren't a complete idiot, you turn and walk to the barracks.\n\nYou come up on a large green tin looking building with a black 'A-4' painted on the front.\n\n As you step through the door, ten or so individuals enter almost immediately after you before making their way to the various plain and uncomfortable looking beds protruding from the wall. They begin unpacking their dufflebags.\n\nA young looking woman takes the bed next to yours and quickly dumps the contents of her dufflebag along the bed, causing the items inside to be sprawled out along the bed. She shifts her gaze up to you as she sorts her items.\n\nRecruit Emma Bates: That was pretty ballsy back there with the Drill Sergeant. You have guts, but you aren't too smart.\n\nYou: He annoyed me and I didn't feel like I had to answer to him.\n\nRecruit Emma Bates: Don't be stupid here. If you don't listen to him, they will discharge you.\n\nShe offers you a small smile as she extends her hand out to you.\n\nRecruit Emma Bates: Emma Bates, a pleasure to meet you. What's your name?";
        [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
        [self.npcImageArea setAlpha:1];
        [self.dialogOptionOne setTitle: @"1.) 'Buzz off.'" forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Say your name and shake her hand." forState:UIControlStateNormal];
        
    }else if (myEngine.choicesMade == 4){
        if ([myEngine.charBackground isEqual:@"Earth"]) {
            self.textArea.text = [NSString stringWithFormat:@"You offer her a small smile before extending your hand outward. She grips your hand firmly before giving it a small shake and releasing it back to you once more.\n\nYou: %@ %@\n\nRecruit Emma Bates: %@, eh? Nice name. So, where are you from?\n\nYou: Earth; it is a horrible place to live. Crime is all over the place and I'm happy to be away from it.\n\nRecruit Emma Bates: I can imagine. I remember my family took a trip there... It was awful. I'm from the outer ring my self. It has a collection of wonderful and beautiful planets.\n\nShe says with a small smile at you though your conversation is quickly cut off by the Drill Sergeant charging into the room before blaring his voice across it.\n\nGunnery Sergeant Hurtman: Lets move! PT time, boys and girls.", myEngine.firstName, myEngine.lastName, myEngine.firstName];
            
            myEngine.privateEmmaBatesLike++;
            
            [self.dialogOptionOne setTitle: @"1.) Follow the rest of the recruits out to PT." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
            [self.dialogOptionTwo setAlpha:0];
            
            myEngine.gunnerySergeantHurtmanLike++;
        } else if ([myEngine.charBackground isEqual:@"Colony"]){
            self.textArea.text = [NSString stringWithFormat:@"You offer her a small smile before extending your hand outward. She grips your hand firmly before giving it a small shake and releasing it back to you once more.\n\nYou: %@ %@\n\nRecruit Emma Bates: %@, eh? Nice name. So, where are you from?\n\nYou: Zeta Reticuli; it is a decent place to live. I miss it sometimes, but I am happy to see the universe.\n\nRecruit Emma Bates: Oh yeah? Colonies are decent places to live, especially Wayland-Yutani ones. I'm from the outer ring my self. It has a collection of wonderful and beautiful planets.\n\nShe says with a small smile at you though your conversation is quickly cut off by the Drill Sergeant charging into the room before blaring his voice across it.\n\nGunnery Sergeant Hurtman: Lets move! PT time, boys and girls.", myEngine.firstName, myEngine.lastName, myEngine.firstName];
            
            myEngine.privateEmmaBatesLike++;
            
            [self.dialogOptionOne setTitle: @"1.) Follow the rest of the recruits out to PT." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
            [self.dialogOptionTwo setAlpha:0];
            
        }
    } else if (myEngine.choicesMade == 8){
        if (myEngine.privateEmmaBatesLike > 0) {
            [myEngine.hangerSounds stop];
            self.textArea.text = [NSString stringWithFormat:@"Master Sergeant Evans: It is Master Sergeant, Private! Get it right!\n\n You offer a quick nod and a salute before grabbing your bag up and walking off towards the bunk area. As you walk through the hanger you notice the industrial style of the ship interior. Yellow hazard lights flicker along the walls and powerloaders move around the area as they load cargo and organize it. As you make your way into the hall, you notice how it is much more modern looking than they hanger, with the only dark metal being the floor grates below you. The walls are push outward and come together to for the shape of a triangle. You walk to down the hall and into a small room marked, 'Barracks' before moving to one of the beds that doesn't look unkept.\n\nAfter placing your bag along the bed you adjust your MARPAT camo BDUs, which fits snuggly on your body. After you unpack your items and place them in a locker located near your bed before you take a long needed sit on your bed. A soft sigh escapes you as you feel the relief set on you. Ater a few moments, a familiar woman walks in-Emma Bates from bootcamp. With the patch of the 501st Marine Assault Unit donned on her right breast pocket, she shifted her gaze to you before a bright smile lit up her face.\n\nPrivate Emma Bates: %@! How are you?", myEngine.firstName];
            
            [self.dialogOptionOne setTitle: @"1.) 'I didn't realize they let girls fight." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Smile and wave." forState:UIControlStateNormal];
        } else {
            [myEngine.hangerSounds stop];
            self.textArea.text = @"It is Master Sergeant, Private! Get it right!\n\n You offer a quick nod and a salute before grabbing your bag up and walking off towards the bunk area. As you walk through the hanger you notice the industrial style of the ship interior. Yellow hazard lights flicker along the walls and powerloaders move around the area as they load cargo and organize it. As you make your way into the hall, you notice how it is much more modern looking than they hanger, with the only dark metal being the floor grates below you. The walls are push outward and come together to for the shape of a triangle. You walk to down the hall and into a small room marked, 'Barracks' before moving to one of the beds that doesn't look unkept.\n\nAfter placing your bag along the bed you adjust your MARPAT camo BDUs, which fits snuggly on your body. After you unpack your items and place them in a locker located near your bed before you take a long needed sit on your bed. A soft sigh escapes you as you feel the relief set on you. Ater a few moments, a familiar woman walks in-Emma Bates from bootcamp. With the patch of the 501st Marine Assault Unit donned on her right breast pocket, she shifted her gaze onto you with a look of resentment.\n\nPrivate Emma Bates: Well, look who it is. How are you?";
            [self.npcImageArea setImage:[UIImage imageNamed:@"emmaimage.png"]];
            [self.npcImageArea setAlpha:1];
            [self.dialogOptionOne setTitle: @"1.) 'I didn't realize they let girls fight." forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Smile and wave." forState:UIControlStateNormal];
        }
    } else if (myEngine.choicesMade == 9) {
        [myEngine.hangerSounds stop];
        if (myEngine.privateEmmaBatesLike >= 0) {
            
            self.textArea.text = [NSString stringWithFormat:@"You wave and smile softly as you push up from the bed. You make your way around the bunks and over to Emma though Emma quickly wrapped your up in a tight hug.\nPrivate Emma Bates: What in the hell are you doing here, %@?\nYou: They shipped me out here right after basic.\nPrivate Emma Bates: Same; I wanted them to send me over to intelligence, but they made me a regular grunt. Just my luck, right?\nYou: That sucks. Well, the 501st aren't too bad from what I hear. You will probably like it here.", myEngine.firstName];
            
            myEngine.privateEmmaBatesLike++;
            myEngine.privateEmmaBatesLike++;
            
            [self.dialogOptionOne setTitle: @"1.) 'The Master Sergeant is a tool.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) 'The Master Sergeant is a stand-up guy.'" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:1];
            
            [self.dialogOptionThree setTitle:@"3.) 'At least we are together here.'" forState:UIControlStateNormal];
        } else {
            self.textArea.text = @"You wave and smile softly as you push up from the bed. You make your way around the bunks and over to Emma, however Emma's expression remains unchanging. She holds her gaze on you as he arms slowly cross over.\nPrivate Emma Bates: What in the hell are you doing here, %@?\nYou: They shipped me out here right after basic.\nPrivate Emma Bates: Well, I suppose I am really unlucky then. I didn't make intelligence, and now I have to deal with a douche like you.\nYou: You might actually like it here.";
            
            myEngine.privateEmmaBatesLike++;
            
            [self.dialogOptionOne setTitle: @"1.) 'The Master Sergeant is a tool.'" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) 'The Master Sergeant is a stand-up guy.'" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:1];
            
            [self.dialogOptionThree setTitle:@"3.) 'At least we are together here.'" forState:UIControlStateNormal];
        }
        
    } else if (myEngine.choicesMade == 10){
        if (myEngine.privateEmmaBatesLike > 0) {
            
            self.textArea.text = [NSString stringWithFormat:@"You offer her a reassuring smile as you speak in a soft and gentle voice.\nYou: The Master Sergeant is a good guy, or at least thats the impression I get. You have nothing to worry about, Emma.\nPrivate Emma Bates: Yeah, I kind of got that impression too. I suppose we will see in time.\nShe offered a small nod of her head before letting out a yawn. After a few minutes, the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent. Emma offers you a small nod before turning and backing out of the bunk.\nPrivate Emma Bates: See you there, %@.", myEngine.firstName];
            
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        } else  {
            self.textArea.text = [NSString stringWithFormat:@"You shrug your shoulders slightly as you give a carefree expression.\nYou: The Master Sergeant is fine, Emma. He seems like a decent guy, so you're fine.\nPrivate Emma Bates: Yeah, well at least it won't be all bad then.\nShe She said with a small smile at you. After a few minutes of talking the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent."];
            
            myEngine.privateEmmaBatesLike++;
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        }
    } else if (myEngine.choicesMade == 11){
        
        self.textArea.text = [NSString stringWithFormat:@"You stand up and begin walking out of the barracks and down the hall. Along the hall you notice a sign marked 'Hypersleep' with an arrow pointing to a doorway just to the right of it. As you enter the room the Master Sergeant shifts his gaze onto you and pushes off of the pod.\n\nMaster Sergeant Evans: What are you doing in your BDUs, marine?! Get your butt back to the barracks and change!\nYou quickly nod and sprint back to your barracks and to your bunk. You quickly make your way to your dufflebag before digging out the issues sleep wear. After a few minutes of changing your clothing, you are wearing a pair of short dark briefs along with a white t-shirt showing the acronym 'USCM' in dark letters. You make your way out of the barracks and down the hall wear a few other marines are. You make your way into the room where an estimated 24 marines, both men and women, are talking. They all are wearing the same sleep wear as you and you notice Emma speaking with a couple other soldiers. Master Sergeant Evans sits along one of the sleep pods speaking with who can only be assumed is the Lieutenant."];
        
        [self.dialogOptionOne setTitle: @"1.) Walk over to your sleep pod and climb in" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
        
    }else if (myEngine.choicesMade == 17) {
        self.textArea.text = [NSString stringWithFormat:@"You run forward towards the door, causing a few other marines in your squad to follow behind. The Master Sergeant gestures forward silently, causing 1st platoon to move forward onto the door. They move into breaching positions as you swing your Pulse Rifle up before laying a couple rounds into the side of the door. The bullets slide through the door like a hot knife through butter, but it remains closed. The Master Sergeant charges up and grabs your weapon away from you with a look of anger brewing on his face.\n\nMaster Sergeant Evans: What in the hell are you doing, Private?! Corporal Jaber, open the door-Lance Corporal Amir, assist him.\n\nEvans shoves the weapon back against your chest with enough for to shake you up. After the two marines walk up to the door control panel, they have it open within minutes. The door swing open, exposing the destroyed interior. A couple of marines whistle in amazement at the sight before them before the Master Sergeant motions forward again.\n\nMaster Sergeant Evans: 1st Platoon, move in and secure."];
        
        myEngine.masterSergeantEvansLike--;
        
        [self.dialogOptionOne setTitle: @"1.) Proceed inside." forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
        
        
    }else if (myEngine.choicesMade == 19){
        self.textArea.text = [NSString stringWithFormat:@"Private Kennedy: Shut the hell up, %@. We have a contact on the motion tracker.\nLance Corporal Amir: What the hell is it?\nPrivate Kennedy: I have no idea.\nPrivate Townsend: There isn't anything to our front. Where is the contact?\n\nThe radio begins to Echo as Lieutenant Shilling's voice comes over.\n\nLieutenant Shilling: Squad one, SITREP, over.\nCorporal Jaber: We have something on the motion tracker, but we can't see it. We don't know what it is, over. Gleghorn, reinforce Amir up front.\nPrivate First Class Gleghorn: Copy that, Corporal.\n\nGleghorn moves forward before moving next to Amir, his gun now raising fully and his finger sliding down onto the trigger.", myEngine.lastName];
        [myEngine.motionTrackerMedium stop];
        [myEngine.motionTrackerMediumHigh play];
        [self.dialogOptionOne setTitle: @"1.) Bring your weapon up" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 22){
        [myEngine.motionTrackerHigh stop];
        self.textArea.text = [NSString stringWithFormat:@"You turn on your heels and take off running, behind you, you hear the echo of Pulse Rifles as they presumably fire at the alien. As you run out of the room you feel arms slip around you. As you look up, you come face to face with a silvery alien whos jaws are currently opening. Inside of it's mouth is... a small mouth? Looks like its game over, man."];
        
        [self.dialogOptionOne setTitle: @"1.) Fire up into the Alien" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) Try to Shake free" forState:UIControlStateNormal];
    } else if (myEngine.choicesMade == 23){
        self.textArea.text = [NSString stringWithFormat:@"You swing your legs around as you attempt to shake free. The aliens looses grip and it's razor sharp claws slide across your face, causing blood to pour down. You drop to the ground and look up only to see your platoon in the distance surrounded and being ripped apart. Their cries and screams fill your ear drums as you crawl towards a small hole in the floor grate. After dropping down into the water below, you black out. After an unknown amount of time, you wake up and slowly stand up before gazing around. It appear you're in a sewer system."];
        
        [self.dialogOptionOne setTitle: @"1.) Walk down the Sewer" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 25){
        self.textArea.text = [NSString stringWithFormat:@"The flashbacks of what happen begin to hit you again.\n\nMaster Sergeant Evans: This is Platoon 2, over. We have secured a sole survivor from platoon 1, break. We are falling back onto your position for exfil, over.\n\nYou release a soft groan as the pain of your face hits.\n\nYou: Something came out of this civilian's chest. It killed him and... I ran away. I don't know what happens to Townsend, Gleghorn, or Kennedy.\n\nThe Master Sergeant nods softly as he attempts to help you up.\nMaster Sergeant Evans: Rest easy, son. You didn't do anything wrong. We are getting you out of here."];
        
        [self.dialogOptionOne setTitle: @"1.) Get helped up by Evans" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:1];
        [self.dialogOptionTwo setTitle:@"2.) Refuse the help and stand up yourself" forState:UIControlStateNormal];
    }else if (myEngine.choicesMade == 26){
        self.textArea.text = [NSString stringWithFormat:@"You stand up on your own, because you're the ultimate badass-help is for losers.\n\nPrivate First Class Gavrilvich: Contacts! Multiple! I count four... no... six... eight... fifteen! There are more! They are all around us!\n\nThe Master Sergeant swings his Pulse Rifle up as you struggle to stand on your own. He grips his radio tightly as he begins speaking into it.\n\nMaster Sergeant Evans: Get the evac ready, we are going to be coming in hot, over!\n\n The platoon begins moving forward."];
        [myEngine.motionTrackerSlow play];
        [self.dialogOptionOne setTitle: @"1.) Follow the platoon, and stick close to Master Sergeant Evans" forState:UIControlStateNormal];
        [self.dialogOptionTwo setAlpha:0];
        [self.dialogOptionTwo setTitle:@" " forState:UIControlStateDisabled];
    }else if (myEngine.choicesMade == 30){
        [myEngine.motionTrackerHigh stop];
        [myEngine.smartGunSound stop];
        myEngine.endingTwo = YES;
        [self.navigationController pushViewController:cutsceneView animated:YES];
    }
    
}

- (IBAction)optionThreeButton:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.choicesMade++;
    if (myEngine.choicesMade == 1) {
        self.textArea.text = @"As people begin to stand around you, you continue to sit. An uncaring expression is plastered across your face. As everyone exits the bus the Drill Sergeant narrows his gaze onto you from outside of the bus. You can practically feel his gaze burning into your skull and within moments he charges onto the bus.\n\nGunnery Sergeant Hurtman: You had better be joking with me, boy. You get up now and get off of the friggin' bus or I will hull you off of here!\n\nYour gaze shifts up to the Sergeant as he blares his voice in your face. You merely say nothing and only stare at him. After a mere ten seconds the Drill Sergeant rips you up from your seat and begins dragging you down the bus. He drags you out and drops you onto the ground roughly before hulling you up and slamming his fist into your stomach. You bend over, your body in pain, though the Drill Sergeant doesn't seem to care.\n\nGunnery Sergeant Hurtman: Get in line, boy.\n\nThe pain slowly subsides and you waddle over to the line before stepping in, shoulder to shoulder with the two young men next to you.\n\nYour gaze holds forward as the Drill Sergeant slowly steps down the line, his eyes slowly moving over each individual cadet.\n\nAs he gets to you his gaze narrows, but only for a moment.";
        
        [self.dialogOptionOne setTitle: @"1.) Continue looking forward." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Shift your eyes onto his piercing gaze" forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@"3.) 'What are you looking at?'" forState:UIControlStateNormal];
        
        myEngine.renegade++;
        myEngine.gunnerySergeantHurtmanLike--;
        
    } else if (myEngine.choicesMade == 2){
        self.textArea.text = @"That probably wasn't a good idea. The Drill Segeant stares daggers at you for a moment before shooting his hand forward and placing it firmly on your shoulder before pulling you forward roughly, sending you careening towards the ground. You release out loud grunt as your chest and face meet the brown coarse dirt. The Drill Sergeant raises his right boot before bringing it down into your shoulder blades.\n\nGunnery Sergeant Hurtman: I own you now, boy. You're in my house and you're going to play by my rules. If you don't like that then you are going to have a very bad time here. Now pick yourself up, Recruit.\n\nThe Drill Sergeant continues making his way down the line, his gaze continuely looking over each recruit. You slowly push off the ground with another soft grunt as you fall back in line. Your body aches and is bruised from the slight beating you took. Your gaze falls forward as you watch the Drill Sergeant step before the group.\n\nDrill Segeant Jackson: I am Gunnery Sergeant Hurtman, your Senior Drill Instructor! You will only speak when spoken to and the next six weeks will be the most miserable time of your pathetic lives! You will speak when spoken to and you obey every order given to you by a superior. Welcome to the Corps, recruits. Get to your bunks. Dismissed!";
        
        [self.dialogOptionOne setTitle: @"1.) Step out of line and move to your designated barracks." forState:UIControlStateNormal];
        
        [self.dialogOptionTwo setTitle:@"2.) Continue standing in line." forState:UIControlStateNormal];
        
        [self.dialogOptionThree setTitle:@" " forState:UIControlStateDisabled];
        [self.dialogOptionThree setAlpha:0];
        
        myEngine.gunnerySergeantHurtmanLike--;
        myEngine.renegade++;
    }else if (myEngine.choicesMade == 10){
        if (myEngine.privateEmmaBatesLike < 0) {
            
            self.textArea.text = [NSString stringWithFormat:@"You offer a small smile as you move your hand over to her's.\nYou: At least we are together, Emma. I'm glad about that.\nEmma quickly pulled her hand away from your own before backing up away from you slightly.\nPrivate Emma Bates: Yeah, that is what I am worried about. Get away from me, creep. If you try and touch me again I'll break your hand.\nEmma's expression quickly turns to one of pure anger before she turns and walks away, her boots snapping against the metal floor. You turn and walk to your bunk before slowly slumping down onto the bed, sulking in your embarrasment. After a few minutes of silence the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent."];
            
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        } else if (myEngine.privateEmmaBatesLike <= 2 && myEngine.privateEmmaBatesLike > 0) {
            self.textArea.text = [NSString stringWithFormat:@"You smile softly before moving your hand forward and onto her own. Emma shifts her gaze down to your hand along her's before looking back up to you.\nYou: At least we are together, right?\nEmma's cheeks turn a scarlet shade of red before she slowly pulls her hand away.\nPrivate Emma Bates: Yeah, I guess. I need to get going, %@.\nShe abruptly turns away from you before quickly making her way out the door and away from you. You release a soft sigh before walking over to your bunk and plopping down onto it. After a few minutes of silence the loudspeaker on the ship crackled to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent.", myEngine.firstName];
            
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        } else if (myEngine.privateEmmaBatesLike >= 3) {
            self.textArea.text = [NSString stringWithFormat:@"You offer a slight smirk before your hand slowly moves forward, onto her own. A scarlet color fills her cheeks as she gazes up to you.\nYou: Well, at least we are together.\nEmma's pinky slowly wraps around your own as your gazes hold on each other. Emma seems to swallow the lump in her through before speaking.\nPrivate Emma Bates: Y-Yes... well... I am glad for that.\nShe smiles nervously as you seem to be searching her eyes for something.\nYou: Seeing you has to be the best part of my day so far.\nPrivate Emma Bates: Yeah, mine too. I-I mean, seeing you. Not seeing me.\nEmma chuckles nervously before she shifts her gaze away from yours. The situation is interrupted by the sound of the PA system crackling to life and within a second or two a stern voice began to echo throughout the halls of the ship.\nPA System: This is Lieutenant Shilling, all troops prepare for hyper sleep. Collect your gear and change out of your BDUs. At oh-four-thirty I expect all troops to be in their sleep pods. You have ten minutes to make your way down to the sleep pod.\nThe PA System then crackles before going silent. Emma slowly moves her hand off of yours before leaning up and placing a soft kiss along your cheek. She pulls away before walking backwards to the doorway.\nPrivate Emma Bates: I'll see you down in hyper sleep, %@. Don't be late; I'd like to see you before we all go under.\nYou nod and smile before walking over to your bunk and taking a seat down onto it.", myEngine.firstName];
            
            [self.dialogOptionOne setTitle: @"1.) Stand up and change into your sleep wear" forState:UIControlStateNormal];
            
            [self.dialogOptionTwo setTitle:@"2.) Stand up and walk to the Sleep Chamber" forState:UIControlStateNormal];
            
            [self.dialogOptionThree setAlpha:0];
            
            [self.dialogOptionThree setTitle:@"" forState:UIControlStateDisabled];
        }
    }else if (myEngine.choicesMade == 12) {
        
    }
    
}

- (IBAction)optionFourButton:(id)sender {
    Engine * myEngine = [Engine sharedInstance];
    myEngine.choicesMade++;
    
    if (myEngine.choicesMade == 12) {
    }
    
}

-(void)doMenuMusicVolumeFade
{
    Engine * myEngine = [Engine sharedInstance];
    if (myEngine.menuMusic.volume > 0.1) {
        myEngine.menuMusic.volume = myEngine.menuMusic.volume - 0.1;
        [self performSelector:@selector(doMenuMusicVolumeFade) withObject:nil afterDelay:0.1];
    } else {
        // Stop and get the sound ready for playing again
        [myEngine.menuMusic stop];
        myEngine.menuMusic.currentTime = 0;
        [myEngine.menuMusic prepareToPlay];
        myEngine.menuMusic.volume = 1.0;
    }
}

-(void)doGameMusicOneVolumeFade
{
    Engine * myEngine = [Engine sharedInstance];
    if (myEngine.gameMusic.volume > 0.1) {
        myEngine.gameMusic.volume = myEngine.menuMusic.volume - 0.1;
        [self performSelector:@selector(doMenuMusicVolumeFade) withObject:nil afterDelay:0.1];
    } else {
        // Stop and get the sound ready for playing again
        [myEngine.gameMusic stop];
        myEngine.gameMusic.currentTime = 0;
        [myEngine.gameMusic prepareToPlay];
        myEngine.gameMusic.volume = 1.0;
    }
}

@end
