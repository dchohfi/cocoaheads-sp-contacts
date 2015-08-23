//
//  NUContactsAPI.m
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUContactsAPI.h"

NSString *NUContactsAPIBaseURL = @"https://s3-sa-east-1.amazonaws.com/mobile-challenge";

@implementation NUContactsAPI

+ (instancetype)sharedAPI {
    static NUContactsAPI * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NUContactsAPI alloc] initWithBaseURL:[NSURL URLWithString:NUContactsAPIBaseURL]];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    }
    
    return self;
}

@end
