//
//  JSDFocusSettingVC.m
//  TomatoRemind
//
//  Created by Jersey on 2019/8/5.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDFocusSettingVC.h"

#import "JSDFocusSettingViewModel.h"
#import "JSDTableViewTextCell.h"

@interface JSDFocusSettingVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) JSDFocusSettingViewModel* viewModel;

@end

@implementation JSDFocusSettingVC

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

// TODO: 用通知回调刷新;
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"专注设置";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        if (@available(iOS 11.0,*)) {
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }else{
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.viewModel.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.listArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSDFocusSettingModel* model = self.viewModel.listArray[indexPath.section][indexPath.row];
    NSInteger type = model.type;
    NSArray<JSDTableViewTextCell *>* nibArray =  [[NSBundle mainBundle] loadNibNamed:@"JSDTableViewTextCell" owner:nil options:nil];
    
    JSDTableViewTextCell* cell = nibArray[type];
    [cell setModel:model];
                          
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    UIView* headerView = UIView.new;
//    if (section == 0) {
//
//    } else {
//
//    }
//
//    return headerView;
//}

- (UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* headerView = [[UIView alloc] init];
    UILabel* titleLabel = [[UILabel alloc] init];
    if (section == 0 ) {
        titleLabel.text = @"计时";
    } else {
        titleLabel.text = @"高级";
    }
    [headerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(0);
    }];
    titleLabel.font = [UIFont jsd_fontSize:16];
    titleLabel.textColor = [UIColor jsd_subTitleColor];
    
    return headerView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        [_tableView registerNib:[UINib nibWithNibName:@"" bundle:nil forCellReuseIdentifier: kItemCellIdentifier];
         _tableView.backgroundColor = [UIColor jsd_mainGrayColor];
         _tableView.delegate = self;
         _tableView.dataSource = self;
         _tableView.tableFooterView = [[UIView alloc] init];
         _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
         }
         return _tableView;
}

- (JSDFocusSettingViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[JSDFocusSettingViewModel alloc] init];
    }
    return _viewModel;
}

@end

