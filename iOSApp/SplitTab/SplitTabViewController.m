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

//Prepares to split bill in new modal
- (IBAction)SplitBill:(id)sender {
     AllGuests *sharedGuests = [AllGuests sharedGuests];
    [sharedGuests setBill:_totalBill];
    [sharedGuests setTipPercent:_tipPercent];
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
