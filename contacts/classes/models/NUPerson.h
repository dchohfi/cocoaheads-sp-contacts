//
//  NUPerson.h
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface NUPerson : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSDate *dayOfBirthday;
@property (nonatomic, readonly, copy) NSURL *image;

@end
