//
//  NUContactsFunctionalTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "KIF.h"
#import "KIFUITestActor+NUAdditions.h"

@interface NUContactsFunctionalTests : KIFTestCase

@end

@implementation NUContactsFunctionalTests

- (void)testShouldLoadContactsOnLoad {
    [tester waitForContactsToBeLoaded];
}

- (void)testShouldShowMessageComposerOnTapRow {
    [tester waitForContactsToBeLoaded];
    
    [tester tapRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] inTableViewWithAccessibilityIdentifier:@"tabela-contatos"];


    [tester waitForViewWithAccessibilityLabel:@"Olar :)"];
    [tester tapViewWithAccessibilityLabel:@"Cancel"];
}

- (void)testShouldReloadContactsOnPullToRefresh {
    [tester waitForContactsToBeLoaded];
    
    [tester scrollViewWithAccessibilityIdentifier:@"tabela-contatos"
                       byFractionOfSizeHorizontal:0.f
                                         vertical:0.3f];
    
    [tester waitForContactsToBeLoaded];
}

@end
