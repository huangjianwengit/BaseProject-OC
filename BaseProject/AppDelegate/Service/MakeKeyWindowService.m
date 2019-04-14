//
//  MakeKeyWindowService.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/12/1.
//  Copyright © 2018 Jivan. All rights reserved.
//

#import "MakeKeyWindowService.h"
#import "JHBaseTabBarController.h"
@implementation MakeKeyWindowService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self makeKeyWindow];
    return YES;
}

-(void)makeKeyWindow
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window ;
    window.frame =  UIScreen.mainScreen.bounds;
    window.backgroundColor = [UIColor whiteColor];
    JHBaseTabBarController * baseTab = [[JHBaseTabBarController alloc]init];
    window.rootViewController = baseTab;
    [window makeKeyAndVisible];
}

@end
