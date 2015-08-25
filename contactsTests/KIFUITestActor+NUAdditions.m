//
//  KIFUITestActor+NUAdditions.m
//  contacts
//
//  Created by Diego Chohfi on 8/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "KIFUITestActor+NUAdditions.h"

@implementation KIFUITestActor (NUAdditions)

- (void)waitForContactsToBeLoaded {
    [self waitForAbsenceOfViewWithAccessibilityLabel:@"Carregando contatos"];
    [self waitForAbsenceOfViewWithAccessibilityLabel:@"Contatos carregados :)"];
}

@end
