//
//  NUContactsController.h
//  contacts
//
//  Created by Diego Chohfi on 8/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUBlocks.h"

@interface NUContactsController : NSObject

+ (NSURLSessionTask *)getContactsWithBlock:(NUArrayCompletionBlock)block;

@end