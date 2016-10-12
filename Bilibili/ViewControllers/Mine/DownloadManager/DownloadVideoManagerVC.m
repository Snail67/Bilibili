//
//  DownloadVideoManagerVC.m
//  Bilibili
//
//  Created by ane_it_ios on 16/9/27.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "DownloadVideoManagerVC.h"
#import "UIViewController+HeaderView.h"


@interface DownloadVideoManagerVC ()

@end

@implementation DownloadVideoManagerVC

- (UIStatusBarStyle)preferredStatusBarStyle; {
    return UIStatusBarStyleLightContent;
}

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubviews];
    
}

- (void)loadSubviews {
    
    self.view.backgroundColor = CRed;

    self.navigationItem.title = @"离线管理";
    
    UIView * newView = [UIView new];
    newView.backgroundColor = [UIColor redColor];
    [self.view addSubview:newView];
    
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 0;
        make.right.offset = 0;
        make.bottom.offset = 0;
        make.top.equalTo(self.navigationBar.mas_bottom);
    }];

}


@end
