//
//  alertView.m
//  SXSnippy
//
//  Created by Evan Matthew on 14/3/2568 BE.
//


#import "alertView.h"
#import <Cocoa/Cocoa.h>

@implementation alertView

- (void)alertWithMessage:(nonnull NSString *)message {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleInformational;
    alert.messageText = message;
    alert.informativeText = @"Snippy is an open source project brought to you by Evan Matthew.";
 
    
    [alert addButtonWithTitle:@"Visit GitHub"];    // First button
    [alert addButtonWithTitle:@"Donate"]; // Second button
   
    NSInteger result = [alert runModal];
    
    
    if (result == NSAlertFirstButtonReturn) {
        NSString *urlString = @"https://GitHub.com";
           NSString *command = [NSString stringWithFormat:@"open %@", urlString];
           system([command UTF8String]);
    } else if (result == NSAlertSecondButtonReturn) {
        NSLog(@"im poor");
    }
}

@end
