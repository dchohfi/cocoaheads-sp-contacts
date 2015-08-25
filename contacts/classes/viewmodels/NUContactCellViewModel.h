//
//  NUContactCellViewModel.h
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NUPerson;

@interface NUContactCellViewModel : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSURL *image;
@property (nonatomic, readonly, copy) NSString *dayOfBirthday;

@property (nonatomic, readonly, copy) NUPerson *person;

- (instancetype)initWithContact:(NUPerson *)person;

@end
