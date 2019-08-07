//
//  UIImage+JSDTool.m
//  SmallTarget
//
//  Created by Jersey on 2019/7/31.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "UIImage+JSDTool.h"

@implementation UIImage (JSDTool)

+ (instancetype)JSD_imageNamePNG:(NSString *)namePNG {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:namePNG ofType:@"png"];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    
    return image;
}

+ (UIImage *)JSD_getImageWithColor:(UIColor *)color{
    
    CGSize size = CGSizeMake(1.0f, 1.0f);
    return [self JSD_getImageWithColor:color withSize:size];
    
}

+ (UIImage *)JSD_getImageWithColor:(UIColor *)color withSize:(CGSize)size{
    
    if (size.width == 0 || size.height == 0) {
        CGSize defaultSize = CGSizeMake(100, 100);
        size = defaultSize;
    }
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    return image;
}

@end
