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
@property NSMutableArray *billsPaid;
@property NSMutableArray *change;
@property (nonatomic) int owed;

-(id)initWithName:(NSString *)newName :(int)twenties :(int)tens :(int)fives :(int)ones;
-(int) twenties;
-(int) tens;
-(int) fives;
-(int) ones;
@end
