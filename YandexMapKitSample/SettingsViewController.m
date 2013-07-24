/*
 * SettingsViewController.m
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2013 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import "SettingsViewController.h"
#import "Settings.h"

@interface SettingsViewController ()

@property(nonatomic, weak) IBOutlet UITextField *keyTextField;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;

@end


@implementation SettingsViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.title = NSLocalizedString(@"Settings", @"Screen title");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.keyTextField.text = [Settings sharedSettings].apiKey;
    self.navigationItem.leftBarButtonItem = self.cancelButton;
    self.navigationItem.rightBarButtonItem = self.saveButton;
}

- (void)viewDidUnload
{
    self.cancelButton = nil;
    self.saveButton = nil;
    self.keyTextField = nil;
    [super viewDidUnload];
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
