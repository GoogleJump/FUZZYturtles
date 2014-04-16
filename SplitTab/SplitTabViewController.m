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

- (IBAction)touchAddGuest:(id)sender {
    self.numGuests++;
}

- (IBAction)touchSubtractGuest:(id)sender {
    self.numGuests--;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
