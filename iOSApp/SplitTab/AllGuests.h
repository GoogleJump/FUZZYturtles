//
//  AllGuests.h
//  SplitTab
//  Singleton class from tutorial by Matt Galloway
//  http://www.galloway.me.uk/tutorials/singleton-classes/
//  Created by Miranda Strand on 7/25/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"

@interface AllGuests : NSObject {
    NSMutableArray *guests;
    double bill;
}

@property (nonatomic, retain) NSMutableArray *guests;
@property (nonatomic) double bill;
@property Guest *guestNoCash; //record guest without enough cash
@property Guest *guestNoChange; //record guest who can't get change

+ (id)sharedGuests;


@end
