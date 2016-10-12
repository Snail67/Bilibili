//
//  ScrollTabBarController.h
//  bilibili fake
//
//  Created by ane_it_ios on 16/8/21.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTabBarController : UITabBarController

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture;

@end
