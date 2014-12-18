//
//  AppDelegate.m
//  Devise
//
//  Created by Patryk Kaczmarek on 19.11.2014.
//  Copyright (c) 2014 Netguru.co. All rights reserved.
//

#import "AppDelegate.h"
#import "Devise.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *urlString = @"https://devise-ios-rails-example.herokuapp.com";
    
    DVSConfiguration *sharedConfiguration = [DVSConfiguration sharedConfiguration];

    [sharedConfiguration setServerURL:[NSURL URLWithString:urlString]];
    [sharedConfiguration setLoggingMode:DVSLoggingModeWarning];
    [sharedConfiguration setShowsNetworkActivityIndicator:YES];
    
    return YES;
}

@end
