//
//  SplitTabViewController.m
//  SplitTab
//
//  Created by Miranda Strand on 4/5/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "SplitTabViewController.h"

@interface SplitTabViewController ()
@property (weak, nonatomic) IBOutlet UILabel *guestsLabel;
@property (nonatomic) int numGuests;
@property (nonatomic) double totalBill;
@end

@implementation SplitTabViewController
@synthesize billLabel;

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
    if (_numGuests > 0) {
        billLabel.text = [NSString stringWithFormat:@"%.2f per guest", _totalBill / _numGuests];
    } else {
        billLabel.text = [NSString stringWithFormat:@"%.2f per guest", _totalBill];
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
    billLabel.text = [NSString stringWithFormat:@"%.2f per guest", _totalBill / _numGuests];
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
// To do if needed
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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