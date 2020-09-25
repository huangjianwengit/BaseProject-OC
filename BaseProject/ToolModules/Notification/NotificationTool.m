//
//  NotificationTool.m
//  WanBox
//
//  Created by Jivan on 2020/7/6.
//  Copyright © 2020 Jivan. All rights reserved.
//

#import "NotificationTool.h"

@implementation NotificationTool
#pragma mark 注册通知监听
+ (void)registerNotification:(NSString *)notificationName Observer:(id)observer Selector:(SEL)selector{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notificationName object:nil];
}

+ (void)registerNotification:(NSString *)notificationName Observer:(id)observer Selector:(SEL)selector object:(id) object{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notificationName object:object];
}

#pragma mark 移除通知监听
+ (void)unRegisterNotification:(NSString *)notificationName Observer:(id)observer{
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:notificationName object:nil];
}

#pragma mark 发送通知
+ (void)postNotificationName:(NSString *)notificationName withObject:(id)object{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:object];
}
+ (void)postNotificationName:(NSString *)notificationName withObject:(id)object userInfo:(NSDictionary *)userInfo{
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:object userInfo:userInfo];
}

@end
