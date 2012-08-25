/*
 * SettingsViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "SettingsViewController.h"
#import "Settings.h"

@interface SettingsViewController ()

@property(nonatomic, strong) IBOutlet UITextField *keyTextField;

@end


@implementation SettingsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.keyTextField.text = [Settings sharedSettings].apiKey;
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.keyTextField = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.keyTextField becomeFirstResponder];
}

- (IBAction)saveButtonTapped:(id)sender {
    [Settings sharedSettings].apiKey = self.keyTextField.text;
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
