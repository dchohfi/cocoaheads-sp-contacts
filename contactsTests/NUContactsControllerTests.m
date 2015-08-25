//
//  NUContactsControllerTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NUContactsController.h"

#import "OHHTTPStubs.h"

@interface NUContactsControllerTests : XCTestCase

@end

@implementation NUContactsControllerTests

- (void)testShouldBeAbleToConvertContactsCorrectly {
    id<OHHTTPStubsDescriptor> stub =
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        BOOL containsPeopleURL = [request.URL.absoluteString hasSuffix:@"people.json"];
        XCTAssertTrue(containsPeopleURL);
        XCTAssertEqualObjects(@"GET", request.HTTPMethod);
        XCTAssertNil(request.HTTPBody);
        return containsPeopleURL;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"people.json",self.class)
                                                statusCode:200
                                                   headers:@{@"Content-Type":@"application/json"}];
    }];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Exectation for contact request"];
    
    NSURLSessionTask *task = [NUContactsController getContactsWithBlock:^(NSArray *array, NSError *error) {
        XCTAssertNil(error);
        XCTAssertNotNil(array);
        XCTAssertEqual(array.count, 5);
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [OHHTTPStubs removeStub:stub];
    }];
}

@end
