//
//  UIView+JSDFrame.h
//  SmallTarget
//
//  Created by Jersey on 2019/7/31.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JSDFrame)

- (CGFloat)JSD_left;
- (void)JSD_setleft:(CGFloat)x;
- (CGFloat)JSD_top;
- (void)JSD_settop:(CGFloat)y;
- (CGFloat)JSD_right;
- (void)JSD_setright:(CGFloat)right;
- (CGFloat)JSD_bottom;
- (void)JSD_setbottom:(CGFloat)bottom;

- (CGFloat)JSD_width;
- (void)JSD_setwidth:(CGFloat)width;
- (CGFloat)JSD_height;
- (void)JSD_setheight:(CGFloat)height;
- (CGPoint)JSD_origin;
- (void)JSD_setorigin:(CGPoint)origin;
- (CGSize)JSD_size;
- (void)JSD_setsize:(CGSize)size;
- (CGFloat)JSD_centerX;
- (void)setcenterX:(CGFloat)centerX;
- (CGFloat)JSD_centerY;
- (void)setcenterY:(CGFloat)centerY;

@end

NS_ASSUME_NONNULL_END
