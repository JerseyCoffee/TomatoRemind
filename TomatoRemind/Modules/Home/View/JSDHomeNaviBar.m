//
//  JSDHomeNaviBar.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDHomeNaviBar.h"

#import "JSDMyCenterVC.h"
#import "JSDFocusSettingVC.h"

@interface JSDHomeNaviBar ()

@property (weak, nonatomic) IBOutlet MDCButton *leftItemButton;
@property (weak, nonatomic) IBOutlet MDCButton *rightItemButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation JSDHomeNaviBar

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.titleLabel.font = [UIFont jsd_fontSize:18];
    self.titleLabel.textColor = [UIColor jsd_colorWithHexString:@"#576378"];
    self.titleLabel.text = @"番茄钟";
    
    UIImage* image = [UIImage imageNamed:@"home_setting"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self.rightItemButton setImage:image forState:UIControlStateNormal];
    self.rightItemButton.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.rightItemButton setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage* leftImage = [UIImage imageNamed:@"user_icon"];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self.leftItemButton setImage:leftImage forState:UIControlStateNormal];
    self.leftItemButton.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.leftItemButton setBackgroundImage:leftImage forState:UIControlStateNormal];
}

- (IBAction)onTouchLeftItem:(id)sender {
    
    JSDMyCenterVC* myCenterVC = [[JSDMyCenterVC alloc] init];
    
    UINavigationController* rootNav = (UINavigationController* )JSDAppWindow.rootViewController;
    [rootNav pushViewController:myCenterVC animated:YES];
    
}

- (IBAction)onTouchRightItem:(id)sender {
    
    JSDFocusSettingVC* focusVC = [[JSDFocusSettingVC alloc] init];
    
    UINavigationController* rootNav = (UINavigationController* )JSDAppWindow.rootViewController;
    [rootNav pushViewController:focusVC animated:YES];
    
}

@end
