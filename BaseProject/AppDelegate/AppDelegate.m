//
//  AppDelegate.m
//  MagpiesMallUser
//
//  Created by qmai on 2019/2/23.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import "AppDelegate.h"
#import "SOAComponentAppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     //注册切面服务协议
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]){
            [service application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillResignActive:)]){
            [service applicationWillResignActive:application];
        }
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]){
            [service applicationDidEnterBackground:application];
        }
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillEnterForeground:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationDidBecomeActive:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillTerminate:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation{
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]){
            [service application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    
    return YES ;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:openURL:options:)]){
        
            if (@available(iOS 9.0, *)) {
                [service application:app openURL:url options:options];
            } else {
                // Fallback on earlier versions
            }
        }
    }
    return YES;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]){
            [service application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
    
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken
{
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]){
            [service application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}
//iOS7及以上系统，收到通知此方法在接收到静默推送的时候会调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        
        if ([service respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]){
            [service application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

//iOS6系统，收到通知此方法在接收到静默推送的时候会调用
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:didReceiveRemoteNotification:)]){
            [service application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

@end

