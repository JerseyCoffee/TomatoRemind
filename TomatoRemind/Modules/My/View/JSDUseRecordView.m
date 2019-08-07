//
//  JSDUseRecordView.m
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDUseRecordView.h"

@interface JSDUseRecordView ()

@property (weak, nonatomic) IBOutlet UIView *useTimeContentView;
@property (weak, nonatomic) IBOutlet UILabel *timeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *useTimeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *useTimeNumberLabel;


@property (weak, nonatomic) IBOutlet UIView *useDayContentView;
@property (weak, nonatomic) IBOutlet UILabel *useDayTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *useDaysTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *useDayNumberLabel;


@end

@implementation JSDUseRecordView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor JSD_mainGrayColor];
    
    _useTimeContentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    _useTimeContentView.layer.shadowColor = [UIColor colorWithRed:165/255.0 green:177/255.0 blue:201/255.0 alpha:0.3].CGColor;
    _useTimeContentView.layer.shadowOffset = CGSizeMake(0,1);
    _useTimeContentView.layer.shadowOpacity = 1;
    _useTimeContentView.layer.shadowRadius = 6;
    _useTimeContentView.layer.cornerRadius = 10;
    
    _useTimeNumberLabel.font = [UIFont JSD_fontSize:21];
    _useTimeNumberLabel.textColor = [UIColor JSD_mainTextColor];
    
    _useTimeTitleLabel.font = [UIFont JSD_fontSize:14];
    _useTimeTitleLabel.textColor = [UIColor JSD_mainTextColor];
    
    _timeTitleLabel.font = [UIFont JSD_fontSize:12];
    _timeTitleLabel.textColor = [UIColor JSD_subTitleColor];
    
    
    _useDayContentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    _useDayContentView.layer.shadowColor = [UIColor colorWithRed:165/255.0 green:177/255.0 blue:201/255.0 alpha:0.3].CGColor;
    _useDayContentView.layer.shadowOffset = CGSizeMake(0,1);
    _useDayContentView.layer.shadowOpacity = 1;
    _useDayContentView.layer.shadowRadius = 6;
    _useDayContentView.layer.cornerRadius = 10;
    
    _useDayNumberLabel.font = [UIFont JSD_fontSize:21];
    _useDayNumberLabel.textColor = [UIColor JSD_mainTextColor];
    
    _useDaysTitleLabel.font = [UIFont JSD_fontSize:14];
    _useDaysTitleLabel.textColor = [UIColor JSD_mainTextColor];
    
    _useDayTitleLabel.font = [UIFont JSD_fontSize:12];
    _useDayTitleLabel.textColor = [UIColor JSD_subTitleColor];
    
    
    
    
}


@end
