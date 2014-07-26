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
@property (nonatomic) NSMutableString *name;
@property (nonatomic) int twenties;
@property (nonatomic) int tens;
@property (nonatomic) int fives;
@property (nonatomic) int ones;
@end

@implementation GuestViewController

- (IBAction)Enter_Name:(id)sender {
    [_nameField resignFirstResponder];
    _name = [_nameField.text mutableCopy];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _name = [[NSMutableString alloc] init];
    }
    return self;
}

- (IBAction)tappedCloseModal:(id)sender {
    
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    NSMutableArray *guestArray = sharedGuests.guests;
    
    _twenties = 5;
    _tens = 5;
    _fives = 5;
    _ones = 5;
    
    Guest *guest = [[Guest alloc] initWithName:_name :_twenties :_tens :_fives :_ones];
    [guestArray addObject:guest];
    
    [self dismissModalViewControllerAnimated: YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
