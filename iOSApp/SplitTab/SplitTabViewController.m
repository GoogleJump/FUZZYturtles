//
//  SplitTabViewController.m
//  SplitTab
//
//  Created by Miranda Strand on 4/5/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "SplitTabViewController.h"
#import "Guest.h"
#import "Split.h"
#import "AllGuests.h"
#import <math.h>

@interface SplitTabViewController ()
@property (weak, nonatomic) IBOutlet UILabel *guestsLabel;
@property (nonatomic) int numGuests;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) double tipPercent;
@property (nonatomic) double totalBill;
@end

@implementation SplitTabViewController

@synthesize guests = _guests;

//
// Enters the bill from the text field and updates the
// current bill per guest. Called when user presses the
// 'Enter' button
//
-(IBAction)Enter_Bill:(id)sender{
    //close keyboard
    [_billField resignFirstResponder];
    //update total bill amount
    _totalBill = [_billField.text doubleValue];
    
    //print current bill per guest
    double tipFrac = _tipPercent / 100;
    if (_numGuests > 0) {
        //also update the current bill per guest
        double bill = (_totalBill + (tipFrac * _totalBill)) / _numGuests;
        _billLabel.text = [NSString stringWithFormat:@"$%.2f per guest", bill];
    } else {
        _billLabel.text = [NSString stringWithFormat:@"$%.2f per guest", _totalBill + (_totalBill * tipFrac)];
    }
    
}

//
// Sets the number of guests (always > 0) and
// updates the label
//
- (void)setNumGuests:(int)numGuests
{
    //make sure there is always at least 1 guest to avoid dividing by 0
    if (numGuests > 0) {
        _numGuests = numGuests;
    } else {
        _numGuests = 1;
    }
    
    //update the number of guests listed
    self.guestsLabel.text = [NSString stringWithFormat:@"Guests: %d", self.numGuests];
    
    //also update the current bill per guest
    double tipFrac = _tipPercent / 100;
    double bill = (_totalBill + (tipFrac * _totalBill)) / _numGuests;
    _billLabel.text = [NSString stringWithFormat:@"$%.2f per guest", bill];
}

//
// Called when user presses "-" and increments
// number of guests
//
- (IBAction)touchAddGuest:(id)sender {
    self.numGuests++;
}

//
// Called when user presses "-" and decrements
// number of guests
//
- (IBAction)touchSubtractGuest:(id)sender {
    self.numGuests--;
}

//
// Sets the tip percentage
//
- (void)setTipPercent:(double)tipPercent
{
    //make sure tip percentage is always non-negative
    if (tipPercent >= 0) {
        _tipPercent = tipPercent;
    } else {
        _tipPercent = 0;
    }
    
    //make sure numGuests is nonzero to avoid division by 0
    if (self.numGuests == 0) {
        self.numGuests++;
    }
    
    //update the tip percentage listed
    self.tipLabel.text = [NSString stringWithFormat:@"Tip: %.0f%%", self.tipPercent];
    
    //also update the current bill per guest
    double tipFrac = _tipPercent / 100;
    double bill = (_totalBill + (tipFrac * _totalBill)) / _numGuests;
    _billLabel.text = [NSString stringWithFormat:@"$%.2f per guest", bill];
}

//
// Called when user presses "+" and increments tip
//
- (IBAction)touchAddTip:(id)sender {
    self.tipPercent++;
}

//
// Called when user presses "-" and decrements tip
- (IBAction)touchSubtractTip:(id)sender {
    self.tipPercent--;
}

//Splits the bill and prints to console
- (IBAction)SplitBill:(id)sender {
     AllGuests *sharedGuests = [AllGuests sharedGuests];
     NSMutableArray *guestArray = sharedGuests.guests;
     NSArray *billStrs = [NSArray arrayWithObjects:@"twenties", @"tens", @"fives", @"ones", nil];
    
    //Get amount owed per guest
    int numGuests = [guestArray count];
    double tipFrac = _tipPercent / 100;
    double bill = (_totalBill + (tipFrac * _totalBill)) / numGuests;
    int billRound = (int)ceil(bill);
    
    //Run the bill splitting algorithm
    Split *split = [[Split alloc] init];
    NSMutableArray *totalCash = [split sumGuestsCash:guestArray];
    for (Guest *guest in guestArray) {
        NSLog(@"%@", guest.name);
        [guest setOwed:billRound];
        NSMutableArray *guestChange = [[NSMutableArray alloc] init];
        if (![split getGuestsActions:guest totalCash:totalCash change:guestChange]) {
            NSLog(@"Uh oh, there was a problem");
            return;
        }
    }
    for (Guest * guest in guestArray) {
        NSLog(@"%@ puts down", guest.name);
        for (int i = 0; i < 4; i++) {
            int num = [guest.billsPaid[i] intValue];
            if (num > 0) {
                NSLog(@"%d %@", num, billStrs[i]);
            }
        }
        NSLog(@"and takes back");
        int count = 0;
        for (int i = 0; i < 4; i++) {
            int num = [guest.change[i] intValue];
            if (num > 0) {
                NSLog(@"%d %@", num, billStrs[i]);
                count++;
            }
        }
        if (count == 0) NSLog(@"nothing");
    }
}

//
// Additional setup after loading the view
// Sets the number of guests and tip percentage to
// default values
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    _numGuests = 2;
    _tipPercent = 18;
}

//
// To do if needed
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
