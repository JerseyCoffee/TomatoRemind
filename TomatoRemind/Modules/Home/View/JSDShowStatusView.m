//
//  JSDShowStatusView.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDShowStatusView.h"

typedef NS_ENUM(NSUInteger, JSDTaskStatus) {
    JSDTaskStatusNormal, // 未开始
    JSDTaskStatusRun, // 进行中
    JSDTaskStatusSuspended, //暂停
    JSDTaskStatusContinue, //继续运行
    JSDTaskStatusGiveUp, //放弃
    JSDTaskStatusComplection, //完成
};

@interface JSDShowStatusView ()

@property (strong, nonatomic) MDCButton *beginButton;
@property (strong, nonatomic) UIButton *suspendedButton;
@property (strong, nonatomic) UIButton *continueButton;
@property (strong, nonatomic) UIButton *giveUpButton;

@property (nonatomic, strong) dispatch_source_t timer;

@property (nonatomic, strong) NSTimer* timer2;
@property (nonatomic, assign) NSInteger countdown;
@property (nonatomic, assign) JSDTaskStatus taskStatus;

@end

@implementation JSDShowStatusView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor JSD_mainGrayColor];
        [self configuration];
        _taskStatus = JSDTaskStatusNormal;
    }
    return self;
}

- (void)configuration {
    
    _beginButton = [[MDCButton alloc] init];
    [_beginButton setTitleFont:[UIFont JSD_fontSize:18] forState:UIControlStateNormal];
    _beginButton.titleLabel.textColor = [UIColor whiteColor];
    [_beginButton setTitle:@"开始专注" forState:UIControlStateNormal];
//    _beginButton.layer.shadowColor = [UIColor colorWithRed:81/255.0 green:179/255.0 blue:150/255.0 alpha:0.5].CGColor;
//    _beginButton.layer.shadowOffset = CGSizeMake(0,2);
//    _beginButton.layer.shadowOpacity = 1;
//    _beginButton.layer.shadowRadius = 6;
    _beginButton.layer.cornerRadius = 24;
    [_beginButton setBackgroundColor:[UIColor JSD_mainGreenColor] forState:UIControlStateNormal];
    UIImage* buttonImage = [UIImage imageNamed:@"home_begin"];
    [_beginButton setImage:buttonImage forState:UIControlStateNormal];
    [_beginButton setImageTintColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_beginButton addTarget:self action:@selector(onTouchBegin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_beginButton];
    [_beginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(148);
        make.height.mas_equalTo(48);
    }];
    
    //暂停按钮
    _suspendedButton = [[UIButton alloc] init];
//    [_suspendedButton setTitleFont:[UIFont JSD_fontSize:18] forState:UIControlStateNormal];
    [_suspendedButton.titleLabel setFont:[UIFont JSD_fontSize:18]];
//    _suspendedButton.titleLabel.textColor = [UIColor JSD_mainGreenColor];
    [_suspendedButton setTitleColor:[UIColor JSD_mainGreenColor] forState:UIControlStateNormal];
    [_suspendedButton setTitle:@"暂停" forState:UIControlStateNormal];
//    [_suspendedButton setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_suspendedButton setBackgroundColor:[UIColor whiteColor]];
    _suspendedButton.layer.cornerRadius = 24;
    _suspendedButton.hidden = YES;
    _suspendedButton.layer.borderColor = [UIColor JSD_mainGreenColor].CGColor;
    _suspendedButton.layer.borderWidth = 1;
    
    [self addSubview:_suspendedButton];
    [_suspendedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(48);
    }];
    [_suspendedButton addTarget:self action:@selector(onTouchSuspended:) forControlEvents:UIControlEventTouchUpInside];
    
    //
    _continueButton = [[UIButton alloc] init];
//    [_continueButton setTitleFont:[UIFont JSD_fontSize:18] forState:UIControlStateNormal];
    [_continueButton.titleLabel setFont:[UIFont JSD_fontSize:18]];
    [_continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_continueButton setTitle:@"继续" forState:UIControlStateNormal];
//    [_continueButton setBackgroundColor:[UIColor JSD_mainGreenColor] forState:UIControlStateNormal];
    [_continueButton setBackgroundColor:[UIColor JSD_mainGreenColor]];
    _continueButton.layer.cornerRadius = 24;
    _continueButton.hidden = YES;
    [_continueButton addTarget:self action:@selector(onTouchContinue:) forControlEvents:UIControlEventTouchUpInside];
    
    _giveUpButton = [[UIButton alloc] init];
//    [_giveUpButton setTitleFont:[UIFont JSD_fontSize:18] forState:UIControlStateNormal];
    [_giveUpButton.titleLabel setFont:[UIFont JSD_fontSize:18]];
    [_giveUpButton setTitleColor:[UIColor JSD_mainGreenColor] forState:UIControlStateNormal];
    [_giveUpButton setTitle:@"放弃" forState:UIControlStateNormal];
//    [_giveUpButton setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_giveUpButton setBackgroundColor:[UIColor whiteColor]];
    _giveUpButton.layer.cornerRadius = 24;
    _giveUpButton.hidden = YES;
    _giveUpButton.layer.borderColor = [UIColor JSD_mainGreenColor].CGColor;
    _giveUpButton.layer.borderWidth = 1;
    [_giveUpButton addTarget:self action:@selector(onTouchGiveUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_continueButton];
    [self addSubview:_giveUpButton];
    CGFloat centerX = ScreenWidth / 2 - 11 - 50;
    CGFloat centerX2 = ScreenWidth / 2 + 11 + 42.5;
    [self.continueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(48);
//        make.centerX.mas_equalTo(centerX);
        make.left.mas_equalTo(84);
    }];
    
    [self.giveUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(48);
//        make.centerX.mas_equalTo(centerX2);
        make.right.mas_equalTo(-84);
    }];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _beginButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    _beginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
}

- (void)onTouchBegin:(MDCButton *)sender {
    
    NSLog(@"开始倒计时");
    self.taskStatus = JSDTaskStatusRun;
    _countdown = 30;
    [self reloadView];
//    if (!self.timer) {
//        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//        self.timer = timer;
//        @weakify(self)
//        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 10 * NSEC_PER_SEC);
//        dispatch_source_set_event_handler(self.timer, ^{
//            @strongify(self)
//            NSLog(@"正在倒计时%ld", self.countdown--);
//            if (!self.countdown) {
//                NSLog(@"倒计时结束了");
//                [self taskComplection];
//
//            }
//        });
//    }
//    dispatch_resume(self.timer);
    if (!self.timer2) {
        @weakify(self)
        self.timer2 = [NSTimer timerWithTimeInterval:1.0 repeats:true block:^(NSTimer * _Nonnull timer) {
            @strongify(self)
            NSLog(@"正在倒计时%ld", self.countdown--);
            if (!self.countdown) {
                NSLog(@"倒计时结束了");
                [self taskComplection];
            }}];
        [self.timer2 fire];
        [[NSRunLoop currentRunLoop] addTimer:self.timer2 forMode:NSRunLoopCommonModes];
    }

}
//暂停
- (void)onTouchSuspended:(id)sender {
    
    self.taskStatus = JSDTaskStatusSuspended;
//    dispatch_suspend(self.timer);
//    [self.timer2 invalidate];
    [self.timer2 setFireDate:[NSDate distantFuture]];
    [self reloadView];
}

- (void)onTouchContinue:(id)sender {
    
    self.taskStatus = JSDTaskStatusRun;
//    dispatch_resume(self.timer);
//    [[NSRunLoop currentRunLoop] addTimer:self.timer2 forMode:NSRunLoopCommonModes];
//    [self.timer2 fire];
    [self.timer2 setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [self reloadView];
}

//放弃
- (void)onTouchGiveUp:(id)sender {
    
    self.taskStatus = JSDTaskStatusGiveUp;
    
//    self.timer = nil;
//    dispatch_source_cancel(self.timer);
    [self.timer2 invalidate];
    self.timer2 = nil;
    [self reloadView];
}

- (void)taskComplection {
    
    [self onTouchGiveUp: nil];
    NSLog(@"恭喜你完成了任务");
    self.taskStatus = JSDTaskStatusComplection;
    [self reloadView];
}

- (void)reloadView {
    
    if (self.taskStatus == JSDTaskStatusNormal) { //默认
        
        self.beginButton.hidden = NO;
        self.suspendedButton.hidden = YES;
        self.continueButton.hidden = YES;
        self.giveUpButton.hidden = YES;
    } else if (self.taskStatus == JSDTaskStatusRun) { //正在运行
        
        self.beginButton.hidden = YES;
        self.suspendedButton.hidden = NO;
        self.continueButton.hidden = YES;
        self.giveUpButton.hidden = YES;
        
    } else if (self.taskStatus == JSDTaskStatusComplection) { //完成
        
        self.beginButton.hidden = NO;
        self.suspendedButton.hidden = YES;
        self.continueButton.hidden = YES;
        self.giveUpButton.hidden = YES;
    } else if (self.taskStatus == JSDTaskStatusSuspended) {  //暂停
        
        self.beginButton.hidden = YES;
        self.suspendedButton.hidden = YES;
        self.continueButton.hidden = NO;
        self.giveUpButton.hidden = NO;
    } else if (self.taskStatus == JSDTaskStatusContinue) { // 继续
        
        self.beginButton.hidden = YES;
        self.suspendedButton.hidden = NO;
        self.continueButton.hidden = YES;
        self.giveUpButton.hidden = YES;
        
    } else if (self.taskStatus == JSDTaskStatusGiveUp) {
        
        self.beginButton.hidden = NO;
        self.suspendedButton.hidden = YES;
        self.continueButton.hidden = YES;
        self.giveUpButton.hidden = YES;
    }
}

@end
