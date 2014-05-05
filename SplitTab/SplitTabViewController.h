//
//  SplitTabViewController.h
//  SplitTab
//
//  Created by Miranda Strand on 4/5/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplitTabViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *billLabel;

-(IBAction)Enter_Bill:(id)sender;

//- (BOOL)textFieldShouldReturn:(UITextField *)textField;
//- (IBAction) clickedBackground;

@end
