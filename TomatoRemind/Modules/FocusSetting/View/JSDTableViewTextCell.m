//
//  JSDTableViewTextCell.m
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDTableViewTextCell.h"

@interface JSDTableViewTextCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomSubTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *routeImageView;

@property (weak, nonatomic) IBOutlet UISwitch *openSwitch;

@end

@implementation JSDTableViewTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.titleLabel.font = [UIFont JSD_fontSize:18];
    self.titleLabel.textColor = [UIColor JSD_mainTextColor];
    
    self.subTitleLabel.font = [UIFont JSD_fontSize:15];
    self.subTitleLabel.textColor = [UIColor JSD_subTitleColor];
    
    self.bottomSubTitleLabel.font = [UIFont JSD_fontSize:12];
    self.bottomSubTitleLabel.textColor = [UIColor JSD_subTitleColor];
    
    self.routeImageView.image = [UIImage imageNamed:@"right"];
    self.routeImageView.tintColor = [UIColor JSD_subTitleColor];
    
    self.backgroundColor = [UIColor JSD_mainGrayColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(JSDFocusSettingModel *)model {
    
    _model = model;
    
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subtitle;
    self.bottomSubTitleLabel.text = model.subtitle;
    self.openSwitch.on = model.isOpen;
}

@end
