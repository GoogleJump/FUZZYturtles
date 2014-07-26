//
//  AllGuests.h
//  SplitTab
//  Singleton class from tutorial by Matt Galloway
//  http://www.galloway.me.uk/tutorials/singleton-classes/
//  Created by Miranda Strand on 7/25/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllGuests : NSObject {
    NSMutableArray *guests;
}

@property (nonatomic, retain) NSMutableArray *guests;

+ (id)sharedGuests;


@end
