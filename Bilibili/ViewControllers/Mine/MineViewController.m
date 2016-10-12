//
//  MineViewController.m
//  ScrollTabBar
//
//  Created by ane_it_ios on 16/8/21.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "MineViewController.h"
#import "ScrollTabBarController.h"

#import "MineHeaderView.h"
#import "MineCollectionView.h"

#import "DownloadVideoManagerVC.h"

#import "HistoryViewController.h"


@interface MineViewController () <UIGestureRecognizerDelegate>
//RefreshCollectionViewDelegate

@property (strong, nonatomic) MineHeaderView *headerView;

@property (strong, nonatomic) MineCollectionView *collectionView;

@end

@implementation MineViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_mine_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_mine_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle; {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //    self.navigationController.navigationBar.tintColor = UIStyleForegroundColor;
    //    self.navigationController.navigationBar.barTintColor = UIStyleBackgroundColor;
    //    self.navigationController.navigationBar.titleTextAttributes =
    //    @{NSForegroundColorAttributeName: UIStyleForegroundColor,
    //      NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};  //标题颜色和字体
    //    self.navigationItem.backBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIStyleBackgroundColor;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    
    [self loadSubviews];
    
    __weak typeof(self) weakself = self ;
    [_collectionView setHandleDidSelectedItem:^(NSIndexPath *indexPath) {
        [weakself handleDidSelectedItem:indexPath];
    }];

    
    MineGroupEntity *group1 = [[MineGroupEntity alloc] init];
    group1.title = @"个人中心";
    group1.items = @[
                     [MineItemEntity entityWithTitle:@"离线缓存" logoName:@"mine_download"],
                     [MineItemEntity entityWithTitle:@"历史记录" logoName:@"mine_history"],
                     [MineItemEntity entityWithTitle:@"我的收藏" logoName:@"mine_favourite"],
                     [MineItemEntity entityWithTitle:@"我的关注" logoName:@"mine_follow"],
                     [MineItemEntity entityWithTitle:@"我的钱包" logoName:@"mine_pocketcenter"],
                     [MineItemEntity entityWithTitle:@"游戏中心" logoName:@"mine_gamecenter"],
                     [MineItemEntity entityWithTitle:@"主题选择" logoName:@"mine_theme"],
                     ];
    
    
    
    MineGroupEntity *group2 = [[MineGroupEntity alloc] init];
    group2.title = @"我的消息";
    group2.items = @[
                     [MineItemEntity entityWithTitle:@"回复我的" logoName:@"mine_answerMessage"],
                     [MineItemEntity entityWithTitle:@"@我" logoName:@"mine_shakeMe"],
                     [MineItemEntity entityWithTitle:@"收到的赞" logoName:@"mine_gotPrise"],
                     [MineItemEntity entityWithTitle:@"私信" logoName:@"mine_privateMessage"],
                     [MineItemEntity entityWithTitle:@"系统通知" logoName:@"mine_systemNotification"],
                     ];
    
    
    _collectionView.groups = @[group1, group2];

    
    
}



- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer {
    ScrollTabBarController *tabbar = (ScrollTabBarController *)self.tabBarController;
    [tabbar handlePanGesture:panGestureRecognizer];
}


- (void)loadSubviews {
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    _headerView = [[MineHeaderView alloc] init];
    [self.view addSubview:_headerView];
    
    _collectionView = [[MineCollectionView alloc] init];
//    _collectionView.refreshDelegate = self;
    [self.view addSubview:_collectionView];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 0;
        make.right.offset = 0;
        make.top.offset = 20;
        make.height.offset = 150;
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 0;
        make.right.offset = 0;
        make.top.equalTo(_headerView.mas_bottom);
        make.bottom.offset = 3;
    }];
}

//- (void)collectionViewRefreshing:(__kindof RefreshCollectionView *)collectionView {
//     NSLog(@"刷新了");
//}

- (void)handleDidSelectedItem:(NSIndexPath *)indexPath {
    NSLog(@"点击的是第 %ld 个",indexPath.row);
    if(indexPath.section == 0) {
        if (indexPath.row == 0) {
            JHLogFunc ;
            [self.navigationController pushViewController:[[DownloadVideoManagerVC alloc] init] animated:YES];
        }
        else if (indexPath.row == 1) {
            [self.navigationController pushViewController:[[HistoryViewController alloc] init] animated:YES];
            JHLogFunc ;
        }
        else if (indexPath.row == 5) {
//            [self.navigationController pushViewController:[[GameCentreVC alloc] init] animated:YES];
        }else if(indexPath.row == 6){
//            [self.navigationController pushViewController:[[UIStyleSelectionVC alloc] init] animated:YES];
        }
    }
    else if (indexPath.section == 1) {
        
    }
    
}

@end
