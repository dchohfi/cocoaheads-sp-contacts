//
//  NUModelConverter.h
//  contacts
//
//  Created by Diego Chohfi on 8/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NUModelConverter : NSObject

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse;
+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse;

@end
