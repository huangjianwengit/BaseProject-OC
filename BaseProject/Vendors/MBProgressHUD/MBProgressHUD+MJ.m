//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

#define  BGColor  [UIColor colorWithWhite:1 alpha:0.5]

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    __block UIView * blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        
        hud.label.text = text;

        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:1.0];
    });
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    __block UIView * blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.mode = MBProgressHUDModeText ;
        hud.label.text = message;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:1.0];
    });
    
}

+(void)showMultiLineSuccess:(NSString *)success toView:(UIView *)view
{
    __block UIView * blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];

        hud.label.text = success;

        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", @"success.png"]]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        hud.detailsLabel.font = [UIFont systemFontOfSize:16]; //Johnkui - added
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:1.0];
    });
    
    
}
+(void)showMultiLineError:(NSString *)error toView:(UIView *)view
{
    __block UIView * blockView = view;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.detailsLabel.text = error;
        
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", @"error.png"]]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        hud.detailsLabel.font = [UIFont systemFontOfSize:16]; //Johnkui - added
        // 1秒之后再消失
        //  [hud hide:YES afterDelay:1.0];
        [hud hideAnimated:YES afterDelay:1.0];
    });
    
}
+(void)showMultiLineMessage:(NSString *)message toView:(UIView *)view
{
    __block UIView * blockView = view;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.detailsLabel.text = message;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // YES代表需要蒙版效果
        //    hud.dimBackground = YES;
        hud.detailsLabel.font = [UIFont systemFontOfSize:16]; //Johnkui - added
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:1.0];
    });
    
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view Delay:(NSTimeInterval)delay
{
    __block UIView * blockView = view;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.detailsLabel.text = message;

        hud.mode = MBProgressHUDModeText ;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // YES代表需要蒙版效果
        hud.detailsLabel.font = [UIFont systemFontOfSize:16]; //Johnkui - added
        // n 秒之后再消失
        [hud hideAnimated:YES afterDelay:delay];
    });
    
}

#pragma mark 加载中
+ (void)showActivityMessage:(NSString*)message view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeIndeterminate;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
   
}

+ (void)showProgressBarToView:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = @"加载中...";
}


+ (void)showActivityMessage:(NSString*)message{
   
    [self showActivityMessage:message view:nil];
}

+(void)showMultiLineError:(NSString *)error
{
    [self showMultiLineError:error toView:nil];
    
}
+(void)showMultiLineSuccess:(NSString *)success
{
    [self showMultiLineSuccess:success toView:nil];
}
+(void)showMultiLineMessage:(NSString *)message
{
    [self showMultiLineMessage:message toView:nil];
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (void)showMessage:(NSString *)message
{
    [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
     __block UIView * blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        
     if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        
        [self hideHUDForView:blockView animated:YES];
    });
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)hideHUDForView:(UIView *)view Animated:(BOOL)animated
{
    __block UIView * blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (blockView == nil) blockView = [[UIApplication sharedApplication].windows lastObject];
        
       [self hideHUDForView:blockView animated:animated];
    });

   
    
}
@end
