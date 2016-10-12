//
//  CustomLayout.m
//  CollectionView瀑布流
//
//  Created by 张泽楠 on 15/12/24.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()

@property (nonatomic, strong) NSMutableArray *layoutArray;
@end

@implementation CustomLayout

- (id)init {
    if (self = [super init]) {
        self.layoutArray = [NSMutableArray array];
    }
    return self;
}

/**
 *  如果要自定义布局,需要重写prepareLayout方法
 *  准备布局(往数组中放对象)
 */
- (void)prepareLayout {
    [super prepareLayout];
    // N个区
    // 每个区的单元格个数不确定
    NSInteger sectionNum = [self.collectionView numberOfSections];
    for (int i = 0; i < sectionNum; i ++) {
        NSInteger itemNum = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemNum; j ++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            
            UICollectionViewLayoutAttributes *layoutAtt = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            [self.layoutArray addObject:layoutAtt];
            if (i == 0) {
                layoutAtt.frame = CGRectMake(0, 0, 320, 200);
            } else if (i == 1) {
                CGFloat width = (320 - 50)/4;
                CGFloat height = 40;
                CGFloat x = (10 + width)*(j%4) + 10;
                CGFloat y = (10 + height)*(j/4) + 10 + 200;
                layoutAtt.frame = CGRectMake(x, y, width, height);
            } else if(i == 2) {
                if (j == 0) {
                    CGFloat width = (320 - 30)/2;
                    CGFloat height = 40;
                    CGFloat x = 10;
                    CGFloat y = 310;
                    layoutAtt.frame = CGRectMake(x, y, width, height);
                } else {
                    // 瀑布流算法
                }
            }
            
        }
    }
}

/**
 *  会返回当前rect中的所有视图的布局属性
 *  数组中放的都是UICollectionViewLayoutAttributes 对象
 *  只要让它返回一个自定义的数组就完了
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.layoutArray;
}


@end