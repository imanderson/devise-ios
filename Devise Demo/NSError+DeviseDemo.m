//
//  NSError+Devise.m
//  Devise
//
//  Created by Wojciech Trzasko on 12.12.2014.
//  Copyright (c) 2014 Netguru Sp. z o.o. All rights reserved.
//

#import "NSError+DeviseDemo.h"

#import <AFNetworking/AFNetworking.h>

@implementation NSError (DeviseDemo)

NSString * const DVSDemoErrorDomain = @"co.netguru.lib.devise.demo.error";

typedef NS_ENUM(NSInteger, DVSErrorCode) {
    DVSErrorPasswordConfirmNotMatch = 101,
    DVSErrorNewPasswordNotMatch = 102
};

+ (NSError *)dvs_passwordConfirmError {
    return [NSError dvs_errorForCode:DVSErrorPasswordConfirmNotMatch
                localizedDescription:NSLocalizedString(@"Password confirm and current password do not match.", nil)];
}

+ (NSError *)dvs_newPasswordConfirmError {
    return [self dvs_errorForCode:DVSErrorNewPasswordNotMatch
             localizedDescription:NSLocalizedString(@"Passwords do not match.", nil)];
}

+ (NSError *)dvs_errorForCode:(NSInteger)code localizedDescription:(NSString *)localizedDescription {
    return [NSError errorWithDomain:DVSDemoErrorDomain
                               code:code
                           userInfo:@{ NSLocalizedDescriptionKey: localizedDescription}];
}

- (NSInteger)dvs_urlStatusCode {
    return [self.userInfo[AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
}

@end
