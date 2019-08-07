//
//  JSDHomeVC.m
//  TomatoRemind
//
//  Created by ada on 2019/8/4.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDHomeVC.h"
#import "JSDHomeNaviBar.h"
#import "JSDHomeView.h"

@interface JSDHomeVC ()

@property (strong, nonatomic) JSDHomeNaviBar *headerBar;
@property (strong, nonatomic) JSDHomeView *homeView;

@end

@implementation JSDHomeVC

#pragma mark - 1.View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置导航栏
    [self setupNavBar];
    //2.设置view
    [self setupView];
    //3.请求数据
    [self setupData];
    //4.设置通知
    [self setupNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"番茄钟";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor JSD_mainGrayColor];
    
    [self.view addSubview:self.headerBar];
    [self.headerBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
        if (@available(iOS 11, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(0);
        }
    }];
    
    [self.view addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headerBar.mas_bottom);
        if (@available(iOS 11, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            make.bottom.mas_equalTo(0);
        }
    }];
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (JSDHomeNaviBar *)headerBar {
    
    if (!_headerBar) {
        
        _headerBar = [[NSBundle mainBundle] loadNibNamed:@"JSDHomeNaviBar" owner:nil options:nil].lastObject;
    }
    return _headerBar;
}

- (JSDHomeView *)homeView {
    
    if (!_homeView) {
        
        _homeView = [[NSBundle mainBundle] loadNibNamed:@"JSDHomeView" owner:nil options:nil].lastObject;
    }
    return _homeView;
}

@end
