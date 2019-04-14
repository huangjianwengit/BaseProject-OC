//
//
//  XYWKTool.h
//  WKWebViewDemo
//
//  Created by 渠晓友 on 2018/7/3.
//
//  Copyright © 2018年 xiaoyouPrince. All rights reserved.
//
//  可扩展工具类

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "XYScriptMessage.h"

@interface XYWKTool : NSObject

/// 调转到App Store
+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withUrl:(NSURL *)url;
+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withAppID:(NSString *)appID;

//JS 调用原生分享
+ (void)shareWithMessage:(XYScriptMessage *)message ParentView:(UIView *)parentView;
// JS 调用原生导航
+(void)callRouteNavigationWithMessage:(XYScriptMessage *)message ;

@end
