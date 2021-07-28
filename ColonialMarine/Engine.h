//
//  Engine.h
//  ColonialMarine
//
//  Created by  on 5/11/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

@interface Engine : NSObject

@property (strong, nonatomic)AVAudioPlayer * menuMusic;
@property (strong, nonatomic)AVAudioPlayer * hangerSounds;
@property (strong, nonatomic)AVAudioPlayer * gameMusic;
@property (strong, nonatomic)AVAudioPlayer * motionTrackerSlow;
@property (strong, nonatomic)AVAudioPlayer * motionTrackerMedium;
@property (strong, nonatomic)AVAudioPlayer * motionTrackerMediumHigh;
@property (strong, nonatomic)AVAudioPlayer * motionTrackerHigh;
@property (strong, nonatomic)AVAudioPlayer * combatDropMusic;
@property (strong, nonatomic)AVAudioPlayer * smartGunSound;
@property (strong, nonatomic)AVAudioPlayer * sadMusic;

+(Engine *)sharedInstance;

@property (nonatomic, strong) NSString * charBackground;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSString * charHairColor;
@property (nonatomic, strong) NSString * skinColor;

@property int  charAge;

@property int  gunnerySergeantHurtmanLike;
@property int  privateEmmaBatesLike;
@property int  johnLike;
@property int  masterSergeantEvansLike;
@property int  corporalOharaLike;

@property int choicesMade;

@property int intelligence;
@property int patience;
@property int renegade;
@property int paragon;

@property BOOL endingOne;
@property BOOL endingOneGood;
@property BOOL endingOneBad;
@property BOOL endingTwo;
@property BOOL endingTwoGood;
@property BOOL endingTwoBad;


@end
