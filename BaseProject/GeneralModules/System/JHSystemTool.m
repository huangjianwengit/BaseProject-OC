//
//  JHSystemTool.m
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "JHSystemTool.h"
#import <sys/utsname.h>

@implementation JHSystemTool
+(BOOL)isIphoneX{
    
    BOOL iPhoneXSeries = NO;
    
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)){
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries ;
    
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

@end


