//
//  JSDTableViewTextCell.h
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSDFocusSettingViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDTableViewTextCell : UITableViewCell

@property (nonatomic, strong) JSDFocusSettingModel* model;

@end

NS_ASSUME_NONNULL_END
