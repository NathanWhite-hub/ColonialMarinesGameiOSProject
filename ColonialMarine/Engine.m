//
//  Engine.m
//  ColonialMarine
//
//  Created by  on 5/11/15.
//  Copyright (c) 2015 Nathan White. All rights reserved.
//

#import "Engine.h"

@implementation Engine
static Engine * _sharedInstance;

- (id)init
{
    self = [super init];
    if (self) {
       
        // Your initialization code goes here
        
    }
    return self;
}

+ (Engine *)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


@end
