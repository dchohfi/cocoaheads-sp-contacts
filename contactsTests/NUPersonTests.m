//
//  NUPersonTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NUPerson.h"
#import "NUModelConverter.h"

#pragma <#arguments#>
@interface NUPersonTests : XCTestCase

@property (nonatomic, strong) NSDictionary *personData;

@end

@implementation NUPersonTests

#pragma <#arguments#>
- (void)setUp {
    [super setUp];
    
    self.personData =
    @{
      @"name": @"Diego Chohfi Turini",
      @"email": @"diego.chohfi@nubank.com.br",
      @"dob": @"08/12/1987",
      @"image": @"http://graph.facebook.com/1097564182/picture?width=600&height=600"
      };
}

- (void)testShouldBeAbleToParseAPersonObjectFromJSON {
    NUPerson *person = [NUModelConverter convertModelFromJSON:self.personData
                                                        class:[NUPerson class]];
    
    XCTAssertNotNil(person);
    [self validatePerson:person];
}

- (void)testShouldBeAbleToSerializeAPersonObjectToArchive {
    NUPerson *person = [NUModelConverter convertModelFromJSON:self.personData
                                                        class:[NUPerson class]];
    
    NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person];
    
    NUPerson *unarchivedPerson = [NSKeyedUnarchiver unarchiveObjectWithData:personData];
    XCTAssertNotNil(unarchivedPerson);
    
    [self validatePerson:unarchivedPerson];
}

- (void)validatePerson:(NUPerson *)person {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSString *dayOfBirthday = [dateFormatter stringFromDate:person.dayOfBirthday];
    
    XCTAssertEqualObjects(person.name, self.personData[@"name"]);
    XCTAssertEqualObjects(person.email, self.personData[@"email"]);
    XCTAssertEqualObjects(person.image.absoluteString, self.personData[@"image"]);
    XCTAssertEqualObjects(dayOfBirthday, self.personData[@"dob"]);
}

@end
