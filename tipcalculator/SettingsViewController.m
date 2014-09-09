//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Ferras Hamad on 9/8/14.
//  Copyright (c) 2014 Ferras Hamad. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipPer;

- (void)saveSettings;

- (IBAction)onTap:(id)sender;
@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
    self.defaultTipPer.selectedSegmentIndex = [self readSettings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipPer.selectedSegmentIndex forKey:@"default_percent"];
    [defaults synchronize];
    
}
- (int)readSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_percent"];
    return intValue;
}

- (void)viewWillDisappear:(BOOL)animated {
        [self saveSettings];
}

- (IBAction)onTap:(id)sender {
        [self saveSettings];
}

@end
