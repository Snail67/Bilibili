//
//  HistoryViewController.m
//  Bilibili
//
//  Created by ane_it_ios on 16/9/26.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "HistoryViewController.h"

#import "UIViewController+HeaderView.h"
#import "UIAlertView+Block.h"


@interface HistoryViewController ()

@end

@implementation HistoryViewController
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
    [self.view addSubview:UIView.new];
    self.view.backgroundColor = CRed;

    [self loadSubviews];
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)loadSubviews {
    
    self.navigationItem.title = @"历史记录";
    UIBarButtonItem *deleteBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"misc_delete"] style:UIBarButtonItemStyleDone target:self action:@selector(deleteAllHistory)];
    self.navigationItem.rightBarButtonItem = deleteBarButton;
    
    
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

/**
 *  清空历史记录
 */
- (void)deleteAllHistory {
    
    [[UIAlertView alertViewWithTitle:@"清空播放历史" message:@"喵，想掩盖些什么呢？" buttonTitles:@[@"取消", @"清空"] clickedButtonAtIndex:^(NSInteger buttonIndex) {
        
//        if (buttonIndex == 1) {
//            [_model deleteAllHistoryWithSuccess:^{
//                [_collectionView reloadData];
//            } failure:^(NSString *errorMsg) {
//                //                HUDFailure(errorMsg);
//            }];
//        }
        
    }] show];
    
}

@end
