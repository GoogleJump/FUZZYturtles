//
//  Split.h
//  SplitTab
//
//  Created by Miranda Strand on 7/20/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"

@interface Split : NSObject {
    
}

-(BOOL) getGuestsActions:(Guest *)guest totalCash:(NSMutableArray *)totalCash change:(NSMutableArray *)guestChange;

-(NSMutableArray *) sumGuestsCash:(NSMutableArray *)guests;

-(NSMutableArray *) getBillsToPay:(NSMutableArray *)bills owed:(int) owed;

-(BOOL) canMakeExactly:(int)owed twenties:(int)twenties tens:(int)tens fives:(int)fives ones:(int)ones;

//-(void) takeGuest:(Guest *) guest;

@end
