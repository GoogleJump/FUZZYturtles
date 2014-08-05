//
//  ResultViewController.m
//  SplitTab
//
//  Created by Miranda Strand on 7/26/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "ResultViewController.h"
#import "Guest.h"
#import "AllGuests.h"
#import "Split.h"

@interface ResultViewController ()
@property (nonatomic) double bill;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self splitBill];
}

//Splits the bill between the guests. Gets strings for each
//guest's actions and prints them to the label
-(void)splitBill
{
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    
    //Get amount owed per guest and print in top label
    //double tipFrac = sharedGuests.tipPercent / 100;
    int numGuests = [sharedGuests.guests count];
    double billNoTip = sharedGuests.bill / numGuests;
    _billLabel.text = [NSString stringWithFormat:@"$%.2f per guest", billNoTip];
    NSMutableArray *guestArray = sharedGuests.guests;
    NSArray *billStrs = [NSArray arrayWithObjects:@"twent(ies)", @"ten(s)", @"five(s)", @"one(s)", nil];
    
    //Get amount owed per guest as an int
    //int billRound = (int)ceil(bill);
    
    //Location for text to start being printed
    int posx = 20;
    int posy = 130;
    
    //Run the bill splitting algorithm
    Split *split = [[Split alloc] init];
    NSMutableArray *totalCash = [split sumGuestsCash:guestArray];
    for (Guest *guest in guestArray) {
        double tipFrac = (double) guest.tipPercent / 100;
        //NSLog(@"%d", guest.tipPercent);
        double bill = billNoTip + (tipFrac * billNoTip);
        //NSLog(@"bill %.2f", bill);
        int billRound = (int)ceil(bill);
        [guest setOwed:billRound];
        NSMutableArray *guestChange = [[NSMutableArray alloc] init];
        
        //check if algorithm can't solve problem and record it
        if (![split getGuestsActions:guest totalCash:totalCash change:guestChange]) {
            [self placeText:@"This bill can't be split with the available cash!" :posx :posy];
            NSString *prob;
            if (sharedGuests.guestNoCash) {
                prob = [NSString stringWithFormat:@"%@ doesn't have enough cash.", sharedGuests.guestNoCash.name];
            } else if (sharedGuests.guestNoChange) {
                prob = [NSString stringWithFormat:@"%@ wouldn't get enough change.", sharedGuests.guestNoChange.name];
            }
            [self placeText:prob :posx :(posy + 20)];
            return;
        }
    }

    //Print amounts for each guest to put down
    for (Guest * guest in guestArray) {
        NSMutableString *action = [[NSMutableString alloc] initWithString:@"-"];
        [action appendString:guest.name];
        [action appendString:@" puts down "];
        for (int i = 0; i < 4; i++) {
            int num = [guest.billsPaid[i] intValue];
            if (num > 0) {
                [action appendFormat:@"%d %@, ", num, billStrs[i]];
            }
        }
        //remove last comma
        NSString *actionTrunc = [action substringToIndex:(action.length - 2)];
        [self placeText:actionTrunc :posx :posy];
        posy += 30;
    }
    
    //Print amounts for each guest to take back
    for (Guest *guest in guestArray) {
        NSMutableString *action = [[NSMutableString alloc] initWithString:@"-"];
        [action appendString:guest.name];
        [action appendString:@" takes back "];
        int count = 0;
        for (int i = 0; i < 4; i++) {
            int num = [guest.change[i] intValue];
            if (num > 0) {
                [action appendFormat:@"%d %@ ", num, billStrs[i]];
                count++;
            }
        }
        if (count != 0) {
            //remove last comma
            NSString *actionTrunc = [action substringToIndex:(action.length - 2)];
            [self placeText:actionTrunc :posx :posy];
            posy += 30;
        }
    }

}

//Creates the given label at the given position
-(void)placeText:(NSString *)text :(int)x :(int)y {
    UILabel *textLabel;
    
    // Set font and calculate used space
    UIFont *textFont = [UIFont fontWithName:@"Futura" size:12];
    CGSize textStringSize = [text sizeWithFont:textFont constrainedToSize:CGSizeMake(300,50) lineBreakMode:UILineBreakModeWordWrap];
    
    // Position of the text
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, textStringSize.width, textStringSize.height)];
    textLabel.numberOfLines = 2;
    
    // Set text attributes
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = textFont;
    textLabel.text = text;
    
    // Display text
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //[segue.destinationViewController placeText:@"test" :25 :200];
}
*/

@end
