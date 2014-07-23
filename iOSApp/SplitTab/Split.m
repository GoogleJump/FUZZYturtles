//
//  Split.m
//  SplitTab
//
//  Created by Miranda Strand on 7/20/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "Split.h"
#import "Guest.h"

@implementation Split

//Prints the bills this guest should contribute and the ones
//they should take back. At the moment, each guest contributes
//all their money and takes back the appropriate amount.
//Recognizes but doesn't really handle cases where one guest
//doesn't have enough, or change can't be made exactly.
//totalCash parameter is the sum of all the guests' money
//(array of tallies of each bill type)
-(BOOL) getGuestsActions:(Guest *)guest totalCash:(NSMutableArray *)totalCash change:(NSMutableArray *)guestChange
{
    //check if guest has enough cash
    int guestCash = 20 * guest.twenties + 10 * guest.tens + 5 * guest.fives + guest.ones;
    if (guestCash < guest.owed) return false;
    
    //check if guest's change can be made
    int change = guestCash - guest.owed;
    if (![self canMakeExactly:change twenties:[totalCash[0] intValue] tens:[totalCash[1] intValue] fives:[totalCash[2] intValue] ones:[totalCash[3] intValue]]) return false;
    guest.change = [self getBillsToPay:totalCash owed:change];
    
    //if a guest is taking change out of what they put in,
    //they should have never put those bills in
    for (int i = 0; i < 4; i++) {
        if ([guest.billsPaid[i] intValue] == [guest.change[i] intValue]) {
            guest.billsPaid[i] = @0;
            guest.change[i] = @0;
        } else if ([guest.billsPaid[i] intValue] > 0 && [guest.change[i] intValue] > 0) {
            if ([guest.billsPaid[i] intValue] < [guest.change[i] intValue]) {
                guest.change[i] = @([guest.change[i] intValue] - [guest.billsPaid[i] intValue]);
                guest.billsPaid[i] = @0;
            } else if ([guest.billsPaid[i] intValue] > [guest.change[i] intValue]) {
                guest.billsPaid[i] = @([guest.billsPaid[i] intValue] - [guest.change[i] intValue]);
                guest.change[i] = @0;
            }
            
        }
    }
    return true;
}


//Adds up the cash all of the guests in the array have
-(NSMutableArray *) sumGuestsCash:(NSMutableArray *)guests
{
    NSMutableArray *totalCash = [NSMutableArray arrayWithObjects:@0, @0, @0, @0, nil];
    for (Guest *guest in guests) {
        //NSLog(@"%s %d", guest.name, guest.twenties);
        totalCash[0] =  @([totalCash[0] intValue] + guest.twenties);
        totalCash[1] =  @([totalCash[1] intValue] + guest.tens);
        totalCash[2] =  @([totalCash[2] intValue] + guest.fives);
        totalCash[3] =  @([totalCash[3] intValue] + guest.ones);
    }
    return totalCash;
}

//Returns true if a combination of the specified bills
//exists to make the amount owed
-(BOOL) canMakeExactly:(int)owed twenties:(int)twenties tens:(int)tens fives:(int)fives ones:(int)ones
{
    int total = 20 * twenties + 10 * tens + 5 * fives + ones;
    if (total == owed) return true;
    if (total < owed) return false;
    if (twenties - 1 >= 0) {
        if ([self canMakeExactly:owed twenties:(twenties - 1) tens:tens fives:fives ones:ones]) return true;
    }
    if (tens - 1 >= 0) {
        if ([self canMakeExactly:owed twenties:twenties tens:(tens - 1) fives:fives ones:ones]) return true;
    }
    if (fives - 1 >= 0) {
        if ([self canMakeExactly:owed twenties:twenties tens:tens fives:(fives - 1) ones:ones]) return true;
    }
    if (ones - 1 >= 0) {
        if ([self canMakeExactly:owed twenties:twenties tens:tens fives:fives ones:(ones - 1)]) return true;
    }
    return false;
}

//Given an array of available bills and an amount of money,
//returns an array making that amount of money using  bills
//from the given array. Updates the given array to no longer
//include bills that need to be used to make the amount of
//money owed. Assumes the owed amount can be made exactly
//with the bills in the array
-(NSMutableArray *) getBillsToPay:(NSMutableArray *)bills owed:(int) owed
{
    NSMutableArray *billsPaid = [NSMutableArray arrayWithObjects:@0, @0, @0, @0, nil];
    while (owed >= 20 && [bills[0] intValue] > 0) {
        owed -= 20;
        billsPaid[0] = @([billsPaid[0] intValue] + 1);
        bills[0] = @([bills[0] intValue] - 1);
    }
    while (owed >= 10 && [bills[1] intValue] > 0) {
        owed -= 10;
        billsPaid[1] = @([billsPaid[1] intValue] + 1);
        bills[1] = @([bills[1] intValue] - 1);
    }
    while (owed >= 5 && [bills[2] intValue] > 0) {
        owed -= 5;
        billsPaid[2] = @([billsPaid[2] intValue] + 1);
        bills[2] = @([bills[2] intValue] - 1);
    }
    while (owed >= 1 && [bills[3] intValue] > 0) {
        owed -= 1;
        billsPaid[3] = @([billsPaid[3] intValue] + 1);
        bills[3] = @([bills[3] intValue] - 1);
    }
    return billsPaid;
}

@end
