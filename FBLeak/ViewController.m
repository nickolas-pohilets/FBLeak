//
//  ViewController.m
//  FBLeak
//
//  Created by Nickolas Pohilets on 24.06.16.
//  Copyright © 2016 Booking.com. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation ViewController

- (IBAction)createSFSafariViewController:(id)sender {
    __block BOOL callbackWasCalled = NO;
    [FBSession openActiveSessionWithReadPermissions:@[ @"public_profile", @"email", @"user_birthday", @"user_location" ]
                                       allowLoginUI:YES
                                 fromViewController:nil
                                  completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        if(!callbackWasCalled) {
            callbackWasCalled = YES;
            UIAlertController* alert = [[UIAlertController alloc] init];
            alert.title = @"SFSafariViewController spawned";
            [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction * _Nonnull action) {
                [FBSession.activeSession closeAndClearTokenInformation];
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

@end
