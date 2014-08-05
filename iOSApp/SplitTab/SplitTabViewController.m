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
//@property (nonatomic) int numGuests;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) double totalBill;
@property (weak, nonatomic) IBOutlet UIButton *splitButton;
@end

@implementation SplitTabViewController

//@synthesize guests = _guests;

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
}

//Prepares to split bill in new view
- (IBAction)SplitBill:(id)sender {
     AllGuests *sharedGuests = [AllGuests sharedGuests];
    //update total bill amount in case enter wasn't pressed
    _totalBill = [_billField.text doubleValue];
    [sharedGuests setBill:_totalBill];
}

//Creates the given label at the given position
-(void)placeText:(NSString *)text :(int)x :(int)y {
    UILabel *textLabel;
    
    // Set font and calculate used space
    UIFont *textFont = [UIFont fontWithName:@"Futura" size:14];
    CGSize textStringSize = [text sizeWithFont:textFont constrainedToSize:CGSizeMake(100,20) lineBreakMode:NSLineBreakByTruncatingTail];
    
    // Position of the text
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, textStringSize.width, textStringSize.height)];
    
    // Set text attributes
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = textFont;
    textLabel.text = text;
    
    // Display text
    [self.view addSubview:textLabel];
}

//
// Additional setup after loading the view
// Sets the number of guests and tip percentage to
// default values
//
- (void)viewDidLoad
{
    [super viewDidLoad];

    //get keyboards to disappear when user clicks 'Done'
    //[_billField addTarget:nil action:@selector(dummy:)
         //forControlEvents:UIControlEventEditingDidEndOnExit];
    
    AllGuests *sharedGuests = [AllGuests sharedGuests];

    //update totalbill listed
    _totalBill = sharedGuests.bill;
    _billField.text = [NSString stringWithFormat:@"%.2f", _totalBill];
    
    //list the guests
    int posx = 70;
    int posy = 175;
    int count = 0;
    for (Guest *guest in sharedGuests.guests) {
        [self placeText:guest.name :posx :posy];
        posy += 20;
        
       /* CGRect frame = [_splitButton frame];
        frame.origin.y = posy;  // change the location
        [_splitButton setFrame:frame];
        */
        _splitButton.frame = CGRectMake(posx,posy,50,100);
        
        count++;
        //create a second column if necessary
        if (count == 9) {
            posx = 180;
            posy = 175;
        }
    }
}

//
// To do if needed
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //update the general information so that it is saved
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    _totalBill = [_billField.text doubleValue];
    [sharedGuests setBill:_totalBill];
}

@end
