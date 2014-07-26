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

@end

@implementation GuestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)tappedCloseModal:(id)sender {
    
    AllGuests *sharedGuests = [AllGuests sharedGuests];
    NSMutableArray *guestArray = sharedGuests.guests;
    
    Guest *g = [[Guest alloc] initWithName:@"Nina" :1 :1 :1 :1];
    [guestArray addObject:g];
    
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
