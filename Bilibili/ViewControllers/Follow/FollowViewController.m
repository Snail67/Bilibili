//
//  FollowViewController.m
//  ScrollTabBar
//
//  Created by ane_it_ios on 16/8/21.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "FollowViewController.h"
#import "ScrollTabBarController.h"
#import "TestRefreshCollectionView.h"
@interface FollowViewController () <UIGestureRecognizerDelegate>

@end

@implementation FollowViewController
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_attention_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_attention_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CRed;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    
    TestRefreshCollectionView *refreshView = [[TestRefreshCollectionView alloc] init];
    [self.view addSubview:refreshView];
    [refreshView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 64;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];

    
}

- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer {
    ScrollTabBarController *tabbar = (ScrollTabBarController *)self.tabBarController;
    [tabbar handlePanGesture:panGestureRecognizer];
}






@end
