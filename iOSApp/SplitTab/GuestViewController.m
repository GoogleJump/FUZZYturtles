//
//  GuestViewController.m
//  SplitTab
//
//  Created by Miranda Strand on 7/25/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import "GuestViewController.h"
#import "Guest.h"
#import "SplitTabViewController.h"
#import "AllGuests.h"

@interface GuestViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *twentiesField;
@property (weak, nonatomic) IBOutlet UITextField *tensField;
@property (weak, nonatomic) IBOutlet UITextField *fivesField;
@property (weak, nonatomic) IBOutlet UITextField *onesField;
@property (weak, nonatomic) IBOutlet UITextField *tipField;
@end

@implementation GuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //any additional initialization
    }
    return self;
}

//Closes modal without adding any guest information
- (IBAction)tappedCancelCloseModal:(id)sender {
     [self dismissModalViewControllerAnimated: YES];
}

/*//Adds the guest's information to the guests array, closes modal
- (IBAction)tappedCloseModal:(id)sender {
    
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    NSMutableArray *guestArray = sharedGuests.guests;

    NSString *name = _nameField.text;
    int twenties = [_twentiesField.text intValue];
    int tens = [_tensField.text intValue];
    int fives = [_fivesField.text intValue];
    int ones = [_onesField.text intValue];
    
    Guest *guest = [[Guest alloc] initWithName:name :twenties :tens :fives :ones];
    [guestArray addObject:guest];
    
    [self dismissModalViewControllerAnimated: YES];
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //get keyboards to disappear when user clicks 'Done'
    [_nameField addTarget:nil action:@selector(dummy:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    [_tipField addTarget:nil action:@selector(dummy:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
    [_twentiesField addTarget:nil action:@selector(dummy:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
    [_tensField addTarget:nil action:@selector(dummy:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
    [_fivesField addTarget:nil action:@selector(dummy:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
    [_onesField addTarget:nil action:@selector(dummy:)
         forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    NSMutableArray *guestArray = sharedGuests.guests;
    NSString *name = _nameField.text;
    int tip = [_tipField.text intValue];
    int twenties = [_twentiesField.text intValue];
    int tens = [_tensField.text intValue];
    int fives = [_fivesField.text intValue];
    int ones = [_onesField.text intValue];
    Guest *guest = [[Guest alloc] initWithName:name tipPercent:tip :twenties :tens :fives :ones];
    [guestArray addObject:guest];
}

@end
