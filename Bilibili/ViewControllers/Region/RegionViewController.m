//
//  RegionViewController.m
//  ScrollTabBar
//
//  Created by ane_it_ios on 16/8/21.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "RegionViewController.h"
#import "ScrollTabBarController.h"

#import "RegionModel.h"
#import "RegionCollectionViewCell.h"

@interface RegionViewController () <UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collectionView;
@property (strong, nonatomic) RegionModel *model;

@end

@implementation RegionViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_category_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_category_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer {
    ScrollTabBarController *tabbar = (ScrollTabBarController *)self.tabBarController;
    [tabbar handlePanGesture:panGestureRecognizer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CRed;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    [self loadSubviews];
    
    self.model = [[RegionModel alloc]init];
    
    [self.model getRegionListWithSuccess:^{
        [self.collectionView reloadData];
    } failure:^(NSString *errorMsg) {
        
//        HUDFailure(errorMsg);
        NSLog(@"%@",errorMsg);
        
    }];

}

- (void)loadSubviews {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = Font(16);
    titleLabel.textColor = ColorWhite(255);
    titleLabel.backgroundColor = CRed;
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    titleLabel.text = @"分区" ;

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 0;
        make.right.offset = 0;
        make.top.offset = 20;
        make.height.offset = 44;
    }];

    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical ;
    
    CGFloat itemWidth = (SSize.width - 40*4) / 3;
    flowLayout.itemSize = CGSizeMake(itemWidth, [RegionCollectionViewCell heightForWidth:itemWidth]);
    
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing =39;
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 40, 15, 40);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.dataSource =self;
    self.collectionView.delegate =self;
    [self.collectionView registerClass:[RegionCollectionViewCell class] forCellWithReuseIdentifier:@"RegionCollectionViewCell"] ;
    self.collectionView.layer.cornerRadius = 6;
    self.collectionView.backgroundColor = ColorWhite(247);
    self.collectionView.layer.masksToBounds = YES;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 0;
        make.right.offset = 0;
        make.top.equalTo(titleLabel.mas_bottom);
        make.bottom.offset = 3;
        
    }];
    

}

#pragma mark-UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.model.regions count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RegionCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RegionCollectionViewCell" forIndexPath:indexPath];
    [cell setRegion:_model.regions[indexPath.row]];
    return cell;
}








@end
