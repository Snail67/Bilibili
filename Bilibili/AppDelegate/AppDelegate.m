//
//  AppDelegate.m
//  Bilibili
//
//  Created by ane_it_ios on 16/9/3.
//  Copyright © 2016年 ane_it_ssk. All rights reserved.
//

#import "AppDelegate.h"

#import "ScrollTabBarController.h"

#import "StartVCData.h"
#import "StartViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.window = [[UIApplication sharedApplication].delegate window];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ScrollTabBarController alloc] init];
    
    
    [self.window makeKeyAndVisible];
    
    
#warning -对应StartViewController的该类还要看下.
//[StartViewController show]; //启动页有点问题,还没找到原因,
    
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];  //设置状态栏颜色

//    [StartVCData getStartViewData];  
    
    
     /*
#pragma mark-这是测试路径的复制
    NSLog(@"%@",NSHomeDirectory());
    NSString *desPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/db.sqlite"];
    
    NSString *orignPath = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];
   
    if ([[NSFileManager defaultManager] copyItemAtPath:orignPath toPath:desPath error:NULL] == YES) {  //拷贝到目标目录的时候，如果文件已经存在则会直接失败
        NSLog(@"复制成功");
    }
    else {
        NSLog(@"复制失败");
    }
    */
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
