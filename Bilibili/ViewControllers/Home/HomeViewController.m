//
//  HomeViewController.m
//  ScrollTabBar
//
//  Created by ane_it_ios on 16/8/21.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "HomeViewController.h"
#import "ScrollTabBarController.h"

#import "LiveListViewController.h"
#import "RecommendListViewController.h"
#import "BangumiListViewController.h"

#import "HomeHeaderView.h"


@interface HomeViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>
//{
//    HomeHeaderView *_headerView;
//}
@property (nonatomic,strong)HomeHeaderView *headerView;

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HomeViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_home_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_home_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle { //电池栏颜色
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubviews];
    self.view.backgroundColor =CRed;
    /**
     *  点击头部标签栏按钮
     */
    __weak typeof(self) weakself = self;
    
    
    [_headerView setOnClickItem:^(NSInteger idx) {
        [weakself.scrollView setContentOffset:CGPointMake(weakself.scrollView.width * idx, 0) animated:YES];
    }];
    
    
}

- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer {
    ScrollTabBarController *tabbar = (ScrollTabBarController *)self.tabBarController;
    [tabbar handlePanGesture:panGestureRecognizer];
}


- (void)loadSubviews {
    [self.view addSubview:UIView.new];
    self.view.backgroundColor =CRed;

    self.scrollView =[[UIScrollView alloc] init];
    self.scrollView.delegate =self;
    self.scrollView.backgroundColor = CRed;  //CRed
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
//    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGestureRecognizer.delegate = self; //添加滑动的手势
    [self.scrollView addGestureRecognizer:panGestureRecognizer];
    
    // 直播
    LiveListViewController *liveListController = [[LiveListViewController alloc] init];
    [self addChildViewController:liveListController];
    // 推荐
    RecommendListViewController *recommendListController = [[RecommendListViewController alloc] init];
    [self addChildViewController:recommendListController];
    // 番剧
    BangumiListViewController * bangumiListController = [[BangumiListViewController alloc] init];
    [self addChildViewController:bangumiListController];

    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:self.childViewControllers.count] ;
    MASViewAttribute *constraint = self.scrollView.mas_left;
    
    for (UIViewController * controller in self.childViewControllers) {
        [titles addObject:controller.title];
        [self.scrollView addSubview:controller.view];
        [controller.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(constraint);
            make.top.equalTo(self.scrollView);
            make.width.equalTo(self.scrollView);
            make.height.equalTo(self.scrollView);
        }];
        constraint = controller.view.mas_right;
    }
    
    self.headerView = [[HomeHeaderView alloc]initWithTitles:titles];
    [self.view addSubview:self.headerView];

    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset = 20;
        make.height.equalTo(@(44));
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.equalTo(@0);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(constraint);
    }];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth, 0)];
    
    __weak typeof(self) weakself = self;
    [self.headerView setOnClickItem:^(NSInteger idx) {
        [weakself.scrollView setContentOffset:CGPointMake(weakself.scrollView.width * idx, 0) animated:YES];
    }];

    
    
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView; {
    self.headerView.contentOffset = scrollView.contentOffset.x / kScreenWidth;
}

#pragma mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer; {
    if (self.scrollView.contentOffset.x + self.scrollView.frame.size.width < self.scrollView.contentSize.width) {
        return NO;
    }
    UIPanGestureRecognizer *panGestureRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
    CGFloat translationX = [panGestureRecognizer translationInView:self.scrollView].x;
    if (translationX >= 0) {
        return NO;
    }
    return YES;
}


@end
