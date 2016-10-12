//
//  Macro.h
//  Bilibili
//
//  Created by ane_it_ios on 16/9/3.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define ColorRGBA(r, g, b, a)               [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define ColorRGB(r, g, b)                 ColorRGBA((r), (g), (b), 1.0)

#define CRed ColorRGB(253,129,164)

#define ColorWhiteAlpha(white, _alpha)      [UIColor colorWithWhite:(white)/255.0 alpha:_alpha]
#define ColorWhite(white)                   ColorWhiteAlpha(white, 1.0)





#define SSize   [UIScreen mainScreen].bounds.size



//字体 
#define Font(fontSize) [UIFont fontWithName:@"ArialMT" size:fontSize]


// 快速创建弱指针
//#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//#define weakself  __weak typeof(self) weakself = self ;


// 标志子类继承这个方法时需要调用 super，否则给出编译警告
#define RequiresSuper __attribute__((objc_requires_super))






/**
 *  作用域结束后会调用Block   后进先出
 *  Defer {
 *      printf("...");
 *  };
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
static void DeferBlock(__strong void(^*block)(void)) {
    (*block)();
}

#pragma clang diagnostic pop
#define Defer __strong void(^deferBlock)(void) __attribute__((cleanup(DeferBlock), unused)) = ^






#endif /* Macro_h */
