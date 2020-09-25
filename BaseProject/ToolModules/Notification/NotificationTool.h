//
//  NotificationTool.h
//  WanBox
//
//  Created by Jivan on 2020/7/6.
//  Copyright © 2020 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString *NOTIFICATION_LOGINSTATUSCHANGE = @"NOTIFICATION_LOGINSTATUSCHANGE";

@interface NotificationTool : NSObject

#pragma mark 注册通知监听
+ (void)registerNotification:(NSString *)notificationName Observer:(id)observer Selector:(SEL)selector;

+ (void)registerNotification:(NSString *)notificationName Observer:(id)observer Selector:(SEL)selector object:(id) object;

#pragma mark 发送通知
+ (void)postNotificationName:(NSString *)notificationName withObject:(id)object;
+ (void)postNotificationName:(NSString *)notificationName withObject:(id)object userInfo:(NSDictionary *)userInfo;

#pragma mark 移除通知监听
+ (void)unRegisterNotification:(NSString *)notificationName Observer:(id)observer;

@end

