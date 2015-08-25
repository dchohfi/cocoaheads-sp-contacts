//
//  NUContactsController.m
//  contacts
//
//  Created by Diego Chohfi on 8/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUContactsController.h"
#import "NUContactsAPI.h"
#import "NUPerson.h"
#import "NUModelConverter.h"

@implementation NUContactsController

+ (NSURLSessionTask *)getContactsWithBlock:(NUArrayCompletionBlock)block {
    return [[NUContactsAPI sharedAPI] GET:@"people.json"
                               parameters:nil
                                  success:^(NSURLSessionDataTask *task, id responseObject) {
                                      NSArray *contactsData = responseObject[@"contacts"];
                                      
                                      NSArray *contacts =
                                          [NUModelConverter convertModelsFromJSON:contactsData
                                                                            class:[NUPerson class]];
                                      block(contacts, nil);
                                  } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                      block(nil, error);
                                  }];
}

@end
