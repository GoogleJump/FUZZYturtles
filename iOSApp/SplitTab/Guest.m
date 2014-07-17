//
//  Guest.m
//  SplitTab
//
//  Created by Miranda Strand on 7/16/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "Guest.h"

@implementation Guest {
    //private instance variables go here
}

@synthesize name = _name;
@synthesize owed = _owed;
@synthesize twenties = _twenties;
@synthesize tens = _tens;
@synthesize fives = _fives;
@synthesize ones = _ones;

-(id)initWithInfo:(NSString *)newName, int twenties, int tens, int fives, int ones
{
    self = [super init];
    if (self) {
        _name = newName;
        _twenties = twenties;
        _tens = tens;
        _fives = fives;
        _ones = ones;
    }
    return self;
}

-(void) sayMyName
{
    NSLog(_name);
}

@end
