//
//  NUContactCell.h
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NUContactCellViewModel;

@interface NUContactCell : UITableViewCell

@property (nonatomic, strong) NUContactCellViewModel *viewModel;

@end
