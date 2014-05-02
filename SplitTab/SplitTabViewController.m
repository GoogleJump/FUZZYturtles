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
@end

@implementation SplitTabViewController
@synthesize billLabel;

//
// Enters the bill from the text field.
// Called when user presses 'Enter' button
//
-(IBAction)Enter_Bill:(id)sender{
    billLabel.text = _billField.text;
    [_billField resignFirstResponder];
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
    self.guestsLabel.text = [NSString stringWithFormat:@"Guests: %d", self.numGuests];
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
