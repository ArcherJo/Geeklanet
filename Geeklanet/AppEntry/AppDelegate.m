//
//  AppDelegate.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "AppDelegate.h"
#import "../Config/GLGlobalConfigurator.h"

#import "../Feature/Post/Controller/GLMainPageViewController.h"
#import "../Feature/Notice/Controller/GLNoticePageViewController.h"
#import "../Feature/User/Controller/GLUserPageViewController.h"
#import "../Feature/User/Controller/GLAccountViewController.h"
#import "GLTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    GLMainPageViewController * homeVC=[[GLMainPageViewController alloc] init];
    homeVC.title=@"主页";
    homeVC.view.frame = [UIScreen mainScreen].bounds;
    UINavigationController *homeNaviVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage imageNamed:@"main"] selectedImage:[UIImage imageNamed:@"main-fill"]];
    homeNaviVC.navigationBarHidden = YES;
    
    GLNoticePageViewController * noticeVC=[[GLNoticePageViewController alloc] init];
    noticeVC.title=@"通知";
    noticeVC.view.frame = [UIScreen mainScreen].bounds;
    UINavigationController *noticeNaviVC = [[UINavigationController alloc] initWithRootViewController:noticeVC];
    noticeNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通知" image:[UIImage imageNamed:@"notice"] selectedImage:[UIImage imageNamed:@"notice-fill"]];
    noticeNaviVC.navigationBarHidden = YES;
    noticeNaviVC.tabBarItem.badgeValue = @"99+";

    GLUserPageViewController * mineVC=[[GLUserPageViewController alloc] init];
    mineVC.title=@"我的";
    mineVC.view.frame = [UIScreen mainScreen].bounds;
    UINavigationController *mineNaviVC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"user"] selectedImage:[UIImage imageNamed:@"user-fill"]];
    mineNaviVC.navigationBarHidden = YES;
    
    //UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    GLTabBarViewController *tabBarVC = [[GLTabBarViewController alloc]init];
    tabBarVC.viewControllers = @[homeNaviVC,noticeNaviVC,mineNaviVC];
    tabBarVC.selectedViewController = homeNaviVC;
    
    tabBarVC.tabBar.tintColor = [UIColor colorWithRed:18./255. green:150./255. blue:219./255. alpha:1.];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:tabBarVC];
    rootNav.navigationBarHidden = YES;
    rootNav.interactivePopGestureRecognizer.enabled = YES;
    
    [rootNav pushViewController:[[GLAccountViewController alloc] init] animated:NO];
    self.window.rootViewController = rootNav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
