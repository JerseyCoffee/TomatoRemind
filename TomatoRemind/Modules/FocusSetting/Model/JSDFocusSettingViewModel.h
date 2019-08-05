//
//  JSDFocusSettingViewModel.h
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBaseModel.h"

@class JSDFocusSettingModel;
NS_ASSUME_NONNULL_BEGIN

@interface JSDFocusSettingViewModel : JSDBaseModel

@property (nonatomic, strong) NSMutableArray<NSMutableArray<JSDFocusSettingModel *>* >* listArray;

@end

@interface JSDFocusSettingModel : JSDBaseModel

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger type;

@end

NS_ASSUME_NONNULL_END
