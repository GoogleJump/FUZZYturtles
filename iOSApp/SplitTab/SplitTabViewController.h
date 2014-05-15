//
//  SplitTabViewController.h
//  SplitTab
//
//  Created by Miranda Strand on 4/5/14.
//  Copyright (c) 2014 FUZZYturtles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplitTabViewController : UIViewController <UITextFieldDelegate>

//field where bill is entered
@property (weak, nonatomic) IBOutlet UITextField *billField;

//label for current bill per guest
@property (weak, nonatomic) IBOutlet UILabel *billLabel;

//called when enter is pressed for bill field
-(IBAction)Enter_Bill:(id)sender;


@end
