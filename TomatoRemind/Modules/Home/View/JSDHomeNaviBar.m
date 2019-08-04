//
//  JSDHomeNaviBar.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDHomeNaviBar.h"

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
    
}
@end
