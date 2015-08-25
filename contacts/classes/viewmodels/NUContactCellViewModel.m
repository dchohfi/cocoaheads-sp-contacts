//
//  NUContactCellViewModel.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUContactCellViewModel.h"
#import "NUPerson.h"

@implementation NUContactCellViewModel

- (instancetype)initWithContact:(NUPerson *)person {
    self = [super init];
    if (self) {
        _person = [person copy];
        
        _name = [person.name copy];
        _email = [person.email copy];
        _image = [person.image copy];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd/MM/yyyy";
        
        NSString *dayOfBirthday = [formatter stringFromDate:person.dayOfBirthday];
        _dayOfBirthday = [dayOfBirthday copy];
    }
    return self;
}

@end
