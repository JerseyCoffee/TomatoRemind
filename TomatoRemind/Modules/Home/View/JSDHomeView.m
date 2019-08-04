//
//  JSDHomeView.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDHomeView.h"

#import "JSDShowStatusView.h"

@interface JSDHomeView ()

@property (weak, nonatomic) IBOutlet UIView *imageContentView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *centerContentView;
@property (weak, nonatomic) IBOutlet UIImageView *centerImageView;
@property (weak, nonatomic) IBOutlet UIView *showTimeView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerImageViewHeight;

@property (weak, nonatomic) IBOutlet JSDShowStatusView *operationContentView;


@end

@implementation JSDHomeView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setupView];
    
    self.backgroundColor = [UIColor jsd_mainGrayColor];
}

- (void)setupView {
    
    self.imageContentView.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.centerContentView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.centerImageViewHeight.constant = self.centerContentView.jsd_width;
    
    self.centerImageView.layer.cornerRadius = self.centerImageView.jsd_width / 2;
    self.centerImageView.layer.masksToBounds = YES;
    
    self.showTimeView.backgroundColor = [UIColor clearColor];
    
    
}

@end
