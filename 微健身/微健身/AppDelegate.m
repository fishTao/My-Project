//
//  AppDelegate.m
//  微健身
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Header.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [self instantiateRootVC];
    [self.window makeKeyAndVisible];

    
    // Override point for customization after application launch.
    return YES;
}

-(UIViewController *)instantiateRootVC{
    //根据应用打开情况，第一次打开，显示引导页，之后再打开应用，显示的是首页
    
    //app运行的版本号
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *appRun = [user objectForKey:kAppRun];
    
    if ([appRun isEqualToString:currentVersion]) {
        //之前已经运行过该版本
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"main"];
        return vc;
    }else{
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"guide"];
        return vc;
    }
    
    return nil;
}

-(void)guideEnd{
    //切换控制器
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"main"];
    self.window.rootViewController = vc;
    //保存版本号
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    //保存标记
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:kAppRun];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
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
