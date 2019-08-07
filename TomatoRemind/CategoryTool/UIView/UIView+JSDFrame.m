//
//  UIView+JSDFrame.m
//  SmallTarget
//
//  Created by Jersey on 2019/7/31.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "UIView+JSDFrame.h"

@implementation UIView (JSDFrame)

- (CGFloat)JSD_left {
    return self.frame.origin.x;
}

- (void)JSD_setleft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)JSD_top {
    return self.frame.origin.y;
}

- (void)JSD_settop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)JSD_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)JSD_setright:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)JSD_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)JSD_setbottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)JSD_width {
    return self.frame.size.width;
}

- (void)JSD_setwidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)JSD_height {
    return self.frame.size.height;
}

- (void)JSD_setheight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)JSD_origin {
    return self.frame.origin;
}

- (void)JSD_setorigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)JSD_size {
    return self.frame.size;
}

- (void)JSD_setsize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)JSD_centerX {
    
    return self.center.x;
}

- (void)setcenterX:(CGFloat)JSD_centerX {
    
    self.center = CGPointMake(JSD_centerX, self.center.y);
}

- (CGFloat)JSD_centerY {
    
    return self.center.y;
}

- (void)setcenterY:(CGFloat)JSD_centerY  {
    
    self.center = CGPointMake(self.center.x, JSD_centerY);
}

@end
