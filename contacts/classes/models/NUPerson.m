//
//  NUPerson.m
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUPerson.h"
#import "MTLValueTransformer.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation NUPerson

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"name" : @"name",
             @"email" : @"email",
             @"dayOfBirthday" : @"dob",
             @"image" : @"image"};
}

+ (NSValueTransformer *)dayOfBirthdayJSONTransformer {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd/MM/yyyy";
    });

    return [MTLValueTransformer transformerUsingForwardBlock:^NSDate *(NSString *value, BOOL *success, NSError **error) {
        return [formatter dateFromString:value];
    } reverseBlock:^NSString *(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [formatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
