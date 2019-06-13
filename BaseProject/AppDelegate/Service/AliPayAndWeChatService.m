
//
//  AliPayAndWeChatService.m
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/7.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import "AliPayAndWeChatService.h"
#import "MMPayManager.h"

@implementation AliPayAndWeChatService


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation{
    
    [[MMPayManager sharedManager] handleOpenURL:url];
    return YES ;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options{
    
   [[MMPayManager sharedManager] handleOpenURL:url];
    return YES;
}


@end
