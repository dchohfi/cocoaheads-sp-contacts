//
//  NUContactCell.m
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUContactCell.h"
#import "NUPerson.h"
#import "NUContactCellViewModel.h"
#import "UIImageView+AFNetworking.h"

@interface NUContactCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelDayOfBirthday;

@end

@implementation NUContactCell

- (void)setViewModel:(NUContactCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.labelName.text = viewModel.name;
    self.labelEmail.text = viewModel.email;
    [self.imageProfile setImageWithURL:viewModel.image];
    self.labelDayOfBirthday.text = viewModel.dayOfBirthday;
}

@end
