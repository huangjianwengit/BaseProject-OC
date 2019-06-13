//
//  MMJPushService.h
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/20.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <JPUSHService.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMJPushService : NSObject<UIApplicationDelegate,JPUSHRegisterDelegate>

@end

NS_ASSUME_NONNULL_END
