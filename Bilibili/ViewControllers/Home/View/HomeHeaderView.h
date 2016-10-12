//
//  HomeHeaderView.h
//  bilibili fake
//
//  Created by cezr on 16/6/22.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBar.h"

@interface HomeHeaderView : TabBar  //这是直播 推荐 番剧 的头部标题

- (instancetype)initWithTitles:(NSArray<NSString *> *)titles;

@end
