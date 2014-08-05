//
//  AllGuests.m
//  SplitTab
//
//  Created by Miranda Strand on 7/25/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "AllGuests.h"

@implementation AllGuests

@synthesize guests;
@synthesize bill;

+ (id)sharedGuests {
    static AllGuests *sharedGuests = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGuests = [[self alloc] init];
    });
    return sharedGuests;
}

- (id)init {
    if (self = [super init]) {
        guests = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
