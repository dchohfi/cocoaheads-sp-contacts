//
//  NUContactsViewControllerTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "SVProgressHUD.h"

#import "NUContactsViewController.h"
#import "NUContactsController.h"
#import "NUModelConverter.h"
#import "NUPerson.h"

@interface NUContactsViewControllerTests : XCTestCase

@property (nonatomic, strong) NSArray *contacts;

@end

@implementation NUContactsViewControllerTests

- (void)setUp {
    NSArray *contactsData =
    @[@{
          @"name": @"Diego Chohfi Turini",
          @"email": @"diego.chohfi@nubank.com.br",
          @"dob": @"08/12/1987",
          @"image": @"http://graph.facebook.com/1097564182/picture?width=600&height=600"
          },
      @{
          @"name": @"Lucien Constantino",
          @"email": @"lucien.constantino@nubank.com.br",
          @"dob": @"21/08/1984",
          @"image": @"http://graph.facebook.com/1795520015/picture?width=600&height=600"
          }];
    
    self.contacts = [NUModelConverter convertModelsFromJSON:contactsData
                                                      class:[NUPerson class]];
}

- (void)testShouldLoadContactsAndShowCorrectly {
    NUContactsViewController *viewController = [[NUContactsViewController alloc]init];
    
    id progressHudMock = OCMClassMock([SVProgressHUD class]);
    OCMExpect([progressHudMock showWithStatus:[OCMArg isEqual:@"Carregando contatos"]]);
    OCMExpect([progressHudMock showSuccessWithStatus:[OCMArg isEqual:@"Contatos carregados :)"]]);
    
    id contactsControllerMock = OCMClassMock([NUContactsController class]);
    
    OCMExpect([contactsControllerMock getContactsWithBlock:
               [OCMArg checkWithBlock:^BOOL(NUArrayCompletionBlock obj) {
        obj(self.contacts, nil);
        return YES;
    }]]);
    
    UIView *view = viewController.view;
    XCTAssertNotNil(view);
    
    NSUInteger numberOfContacts = [viewController tableView:nil numberOfRowsInSection:0];
    
    XCTAssertEqual(self.contacts.count, numberOfContacts);
    
    OCMVerifyAll(contactsControllerMock);
    OCMVerifyAll(progressHudMock);
    
    [contactsControllerMock stopMocking];
    [progressHudMock stopMocking];
}

@end
