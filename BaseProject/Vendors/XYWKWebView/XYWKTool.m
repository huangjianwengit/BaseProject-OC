//
//
//  XYWKTool.m
//  WKWebViewDemo
//
//  Created by 渠晓友 on 2018/7/3.
//
//  Copyright © 2018年 xiaoyouPrince. All rights reserved.
//
//  抽取一个可扩展工具类

#import "XYWKTool.h"
#import <StoreKit/StoreKit.h>

@interface XYWKTool()<SKStoreProductViewControllerDelegate>

@end
@implementation XYWKTool

static XYWKTool *_tool;
+(instancetype)shareInstance
{
    if (_tool == nil) {
        _tool = [[XYWKTool alloc] init];
    }
    return _tool;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [super allocWithZone:zone];
    });
    return _tool;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withUrl:(NSURL *)url
{
    // 通常App Store的scheme形式为 itms-appss://itunes.apple.com/cn/app/id382201985?mt=8
    // 取出appID
    NSString *urlLastPathComponent = url.lastPathComponent;
    NSString *idStr = [[urlLastPathComponent componentsSeparatedByString:@"?"] firstObject];
    NSString *appID = [idStr substringFromIndex:2];
    
    [self jumpToAppStoreFromVc:fromVc withAppID:appID];
}
#pragma mark - JS 调用原生分享
+(void)shareWithMessage:(XYScriptMessage *)message ParentView:(UIView *)parentView
{

}

#pragma mark - JS 调用原生导航
+(void)callRouteNavigationWithMessage:(XYScriptMessage *)message
{
  
}

/**
 应用内跳转到App Store页
 */
+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withAppID:(NSString *)appID
{
    
    // 直接禁用之前页面,并不可重复点击
    if (!fromVc.view.isUserInteractionEnabled) return;
    [fromVc.view setUserInteractionEnabled:NO];
    
    
    // 创建对象
    SKStoreProductViewController *storeVC = [[SKStoreProductViewController alloc] init];
    // 设置代理
    _tool = _tool ?: [self new];
    storeVC.delegate = _tool;
    // 初始化参数
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appID forKey:SKStoreProductParameterITunesItemIdentifier];
    
    // 跳转App Store页
    [storeVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"错误信息：%@",error.userInfo);
        }
        else
        {
            // 弹出模态视图
            [fromVc presentViewController:storeVC animated:YES completion:^{
                [fromVc.view setUserInteractionEnabled:YES];
            }];
        }
    }];
}


#pragma mark -- SKStoreProductViewControllerDelegate
/**
 SKStoreProductViewControllerDelegate 方法，选择完成之后的处理
 @param viewController SKStoreProductViewController
 */
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    NSLog(@"将要退出 App Store 页面了");
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"已经退出 App Store 页面完成了");
    }];
}



@end
