//
//  UIColor+JSDTool.h
//  SmallTarget
//
//  Created by Jersey on 2019/7/31.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JSDTool)

+ (UIColor *)JSD_colorWithHexString:(NSString *)color; //颜色字符串转换为颜色

+ (UIColor *)JSD_grayColor;
+ (UIColor *)JSD_tealcolor;
+ (UIColor *)JSD_skyBluecolor;
+ (UIColor *)JSD_mainBlueColor;
+ (UIColor *)JSD_mainGreenColor;

#pragma mark -Text Color

+ (UIColor *)JSD_mainTextColor;
+ (UIColor *)JSD_minorTextColor;
+ (UIColor *)JSD_detailTextColor;
+ (UIColor *)JSD_naviTitleColor; //导航栏标题颜色

#pragma mark - Title Color

+ (UIColor *)JSD_mainBlackColor;
+ (UIColor *)JSD_subTitleColor;

+ (UIColor *)JSD_mainGrayColor;

+ (CAGradientLayer *)JSD_setGradualChangeView:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end

NS_ASSUME_NONNULL_END
