//
//  Guest.h
//  SplitTab
//
//  Created by Miranda Strand on 7/16/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Guest : NSObject {
}

@property (copy) NSString *name;
@property double owed;
@property int twenties;
@property int tens;
@property int fives;
@property int ones;

-(id)initWithInfo:(NSString *)newName, int twenties, int tens, int fives, int ones;
-(void) sayMyName;
@end
