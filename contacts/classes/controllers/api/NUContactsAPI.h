//
//  NUContactsAPI.h
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NUContactsAPI : AFHTTPSessionManager

+ (instancetype)sharedAPI;

@end
