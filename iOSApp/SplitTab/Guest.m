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

-(id)initWithName:(NSString *)newName :(int)twenties :(int)tens :(int)fives :(int)ones
{
    self = [super init];
    if (self) {
        _name = newName;
        _billsPaid = [[NSMutableArray alloc] init];
        _change = [NSMutableArray arrayWithObjects:@0, @0, @0, @0, nil];
        [_billsPaid addObject:[NSNumber numberWithInt:twenties]];
        [_billsPaid addObject:[NSNumber numberWithInt:tens]];
        [_billsPaid addObject:[NSNumber numberWithInt:fives]];
        [_billsPaid addObject:[NSNumber numberWithInt:ones]];
    }
    return self;
}

-(void)setOwed:(int)owed
{
    _owed = owed;
}

-(int)twenties
{
    return [_billsPaid[0] intValue];
}

-(int)tens
{
    return [_billsPaid[1] intValue];
}

-(int)fives
{
    return [_billsPaid[2] intValue];
}

-(int)ones
{
    return [_billsPaid[3] intValue];
}

@end
