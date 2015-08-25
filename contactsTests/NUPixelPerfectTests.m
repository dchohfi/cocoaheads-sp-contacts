//
//  NUPixelPerfectTests.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "KIF.h"
#import <Lela/Lela.h>
#import "KIFUITestActor+NUAdditions.h"

@interface NUPixelPerfectTests : KIFTestCase

@end

@implementation NUPixelPerfectTests

- (void)testShouldValidatePixelPerfect {
    [tester waitForContactsToBeLoaded];
    
    [tester expectScreenToMatchImageNamed:@"contacts-loaded"];
}

@end
