//
//  NUContactCellViewModelTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NUContactCellViewModel.h"
#import "NUPerson.h"
#import "NUModelConverter.h"

@interface NUContactCellViewModelTests : XCTestCase

@property (nonatomic, strong) NUPerson *person;

@end

@implementation NUContactCellViewModelTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *personData =
    @{
      @"name": @"Diego Chohfi Turini",
      @"email": @"diego.chohfi@nubank.com.br",
      @"dob": @"08/12/1987",
      @"image": @"http://graph.facebook.com/1097564182/picture?width=600&height=600"
      };

    self.person = [NUModelConverter convertModelFromJSON:personData
                                                   class:[NUPerson class]];
}

- (void)testShouldCreateViewModelCorrectly {
    NUContactCellViewModel *viewModel = [[NUContactCellViewModel alloc] initWithContact:self.person];
    
    XCTAssertEqualObjects(viewModel.name, self.person.name);
    XCTAssertEqualObjects(viewModel.email, self.person.email);
    XCTAssertEqualObjects(viewModel.image, self.person.image);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSString *dayOfBirthday = [dateFormatter stringFromDate:self.person.dayOfBirthday];
    
    XCTAssertEqualObjects(viewModel.dayOfBirthday, dayOfBirthday);
}

@end
