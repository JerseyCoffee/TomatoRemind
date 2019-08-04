//
//  JSDShowStatusView.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDShowStatusView.h"

@interface JSDShowStatusView ()

@property (strong, nonatomic) MDCButton *beginButton;

@end

@implementation JSDShowStatusView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor jsd_mainGrayColor];
        [self configuration];
    }
    return self;
}

- (void)configuration {
    
    _beginButton = [[MDCButton alloc] init];
    [_beginButton setTitleFont:[UIFont jsd_fontSize:18] forState:UIControlStateNormal];
    _beginButton.titleLabel.textColor = [UIColor whiteColor];
    [_beginButton setTitle:@"开始专注" forState:UIControlStateNormal];
//    _beginButton.layer.shadowColor = [UIColor colorWithRed:81/255.0 green:179/255.0 blue:150/255.0 alpha:0.5].CGColor;
//    _beginButton.layer.shadowOffset = CGSizeMake(0,2);
//    _beginButton.layer.shadowOpacity = 1;
//    _beginButton.layer.shadowRadius = 6;
    _beginButton.layer.cornerRadius = 24;
    [_beginButton setBackgroundColor:[UIColor jsd_mainGreenColor] forState:UIControlStateNormal];
    
    [self addSubview:_beginButton];
    [_beginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(148);
        make.height.mas_equalTo(48);
    }];
}

@end
