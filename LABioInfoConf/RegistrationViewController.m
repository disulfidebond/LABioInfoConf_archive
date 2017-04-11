//
//  RegistrationViewController.m
//  LBRN
//
//  Created by John on 2/27/15.
//  Copyright (c) 2015 John. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameText;
@property (weak, nonatomic) IBOutlet UITextField *lastNameText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;


@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emailFieldDidEndOnExit:(UITextField *)sender
{
    NSLog(@"%@", sender.text);
}

- (IBAction)lastNameDidEndOnExit:(UITextField *)sender
{
    NSLog(@"%@", sender.text);
}

- (IBAction)firstNameDidEndOnExit:(UITextField *)sender
{
    NSLog(@"%@", sender.text);
}

- (IBAction)registerPressed:(id)sender {
    NSLog(@"button Pressed");
    self.firstNameText.text = @"";
    self.lastNameText.text = @"";
    self.emailText.text = @"";
    
}
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
