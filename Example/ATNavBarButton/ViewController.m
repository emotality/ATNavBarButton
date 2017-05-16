//
//  ViewController.m
//  ATNavBarButton
//
//  Created by Jean-Pierre Fourie on 2017/05/16.
//  Copyright © 2017 emotality. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setTitle:@"ATNavBarButton"];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    // set left and right navigationbar buttons
    [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonCancel withColor:[UIColor purpleColor] withDelegate:self]];
    [self.navigationItem setRightBarButtonItem:[ATNavBarButton setIndicatorButtonWithColor:[UIColor orangeColor] withDelegate:self]];
}

#pragma mark - ATNavBarButton Delegate

- (void)ATNavBarButton:(ATNavBarButton *)barButton didPressBarButton:(ATNavBarButtonPressed)buttonPressed
{
    if (buttonPressed == ATNavBarButtonCancel) {
        // pressed the cancel button
        [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonUser withColor:[UIColor blueColor] withDelegate:self]];
        [self.navigationItem setRightBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonRefresh withColor:[UIColor redColor] withDelegate:self]];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    } else if (buttonPressed == ATNavBarButtonUser) {
        // pressed the user button
        [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonSettings withColor:[UIColor greenColor] withDelegate:self]];
        
    } else if (buttonPressed == ATNavBarButtonSettings) {
        // pressed the settings button
        [self.navigationItem setLeftBarButtonItem:[ATNavBarButton setBarButton:ATNavBarButtonCancel withColor:[UIColor purpleColor] withDelegate:self]];
        
    } else if (buttonPressed == ATNavBarButtonRefresh) {
        // pressed the refresh button
        [self.navigationItem setRightBarButtonItem:[ATNavBarButton setIndicatorButtonWithColor:[UIColor orangeColor] withDelegate:self]];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

@end
