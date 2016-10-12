//
//  LiveListViewController.m
//  Bilibili
//
//  Created by ane_it_ios on 16/9/7.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//
#import "LiveListViewController.h"

#import "LiveCollectionView.h"
#import "LiveListModel.h"

@interface LiveListViewController ()  <RefreshCollectionViewDelegate>

@property (strong, nonatomic) LiveCollectionView *collectionView;

@property (strong, nonatomic) LiveListModel *model;

@end

@implementation LiveListViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"直播";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorWhite(247);
    
    [self loadSubviews];
    
    [self loadData];
    
}

- (void)loadSubviews {
    _collectionView = [[LiveCollectionView alloc] init];
    _collectionView.refreshDelegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}

- (void)loadData {
    if (!_model) {
        _model = [[LiveListModel alloc] init];
    }
    
    [_model getLiveListWithSuccess:^{
        _collectionView.refreshing = NO;
        _collectionView.liveList = _model.liveList;
    } failure:^(NSString *errorMsg) {
        //
    }];
}

- (void)collectionViewRefreshing:(__kindof RefreshCollectionView *)collectionView {
    [self loadData];
}

@end
