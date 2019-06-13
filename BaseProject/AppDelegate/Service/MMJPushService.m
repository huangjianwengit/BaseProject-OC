//
//  MMJPushService.m
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/20.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import "MMJPushService.h"
#define JPUSHKey @"1a5e768b8dfe84a859befd72"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

static SystemSoundID push = 0;
@implementation MMJPushService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //极光推送注册服务
    [self registerJpushWithOptions:launchOptions];
    return YES;
}

#pragma mark - 添加处理APNs通知回调方法

// iOS 12后 前台自动调用
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification NS_AVAILABLE_IOS(12.0){
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
          [self handleRemoteNotification:userInfo];
    }else{
        
        //从通知设置界面进入应用
          [self handleRemoteNotification:userInfo];
    }
  
}
// iOS 10  收到推送通知后打开推送消息会调用此方法
//触发通知动作时回调，比如点击、删除通知和点击自定义action(iOS 10+)
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
      [self handleRemoteNotification:userInfo];
     completionHandler(UNNotificationPresentationOptionAlert);
    
}
// iOS 10  收到推送通知后打开推送消息会调用此方法
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    
      [self handleRemoteNotification:userInfo];
    completionHandler(UNNotificationPresentationOptionAlert);

    //    LEDLog(@"前台自动调调用了_______%@", userInfo);

}
//iOS7及以上系统，收到通知此方法在接收到静默推送的时候会调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{

    [JPUSHService handleRemoteNotification:userInfo];
      [self handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
//iOS6系统，收到通知此方法在接收到静默推送的时候会调用
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    [self handleRemoteNotification:userInfo];
    [JPUSHService handleRemoteNotification:userInfo];
}

#pragma mark - 处理推送信息
-(void)handleRemoteNotification:(NSDictionary *)userInfo
{
    NSInteger type = [userInfo[@"type"] integerValue];
}
-(void) playSound
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"redbag" ofType:@"mp3"];
    if (path) {
        //注册声音到系统
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&push);
        AudioServicesPlaySystemSound(push);
    }
    AudioServicesPlaySystemSound(push);   //播放注册的声音，（此句代码，可以在本类中的任意位置调用，不限于本方法中）
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);//让手机震动
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"\n>>>>>>>>>>>>>>>>>>>[DeviceToken Success]:%@\n\n", token);
    
   // registrationID  deviceToken   devicetype
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    
}

- (void)registerJpushWithOptions:(NSDictionary *)launchOptions {
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:launchOptions appKey:JPUSHKey channel:@"Publish channel" apsForProduction:YES];
    
}
-(void)applicationWillEnterForeground:(UIApplication *)application
{
     [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
     [JPUSHService resetBadge];
}

@end
