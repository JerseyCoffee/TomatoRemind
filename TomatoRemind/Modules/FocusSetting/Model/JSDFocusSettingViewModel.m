//
//  JSDFocusSettingViewModel.m
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDFocusSettingViewModel.h"

@implementation JSDFocusSettingViewModel

- (NSMutableArray<NSMutableArray<JSDFocusSettingModel *>* >*)listArray {
    
    if (!_listArray) {
        NSArray* array = @[@[@{
                               @"title": @"计时时长",
                               @"subtitle": @"25 分钟",
                               @"isOpen": @"",
                               @"type": @"0",
                               },@{
                                 @"title": @"高效模式",
                                 @"subtitle": @"基于番茄工作法，帮助提示工作学习效率",
                                 @"isOpen": @(YES),
                                 @"type": @"1",
                                 },],
                           @[@{
                                 @"title": @"震动通知",
                                 @"subtitle": @"",
                                 @"isOpen": @(NO),
                                 @"type": @"2",
                                 },@{
                                 @"title": @"屏幕常亮",
                                 @"subtitle": @"开启后，在专注页面内不会熄灭屏幕",
                                 @"isOpen": @(NO),
                                 @"type": @"1",
                                 },@{
                                 @"title": @"每日提醒",
                                 @"subtitle": @"",
                                 @"isOpen": @(YES),
                                 @"type": @"0",
                                 },],
                           
                           ];
        _listArray = [JSDFocusSettingModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}


@end

@implementation JSDFocusSettingModel

@end
