//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)

//view 上显示
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
//可换行
+ (void)showMultiLineSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showMultiLineError:(NSString *)error toView:(UIView *)view;
+ (void)showMultiLineMessage:(NSString *)message toView:(UIView *)view;

//window 上显示
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showMessage:(NSString *)message;
//可换行
+ (void)showMultiLineSuccess:(NSString *)success;
+ (void)showMultiLineError:(NSString *)error;
+ (void)showMultiLineMessage:(NSString *)message;


//延迟消失
+ (void)showMessage:(NSString *)message toView:(UIView *)view Delay:(NSTimeInterval)delay;

//加载hud
+ (void)showActivityMessage:(NSString*)message;
+ (void)showProgressBarToView:(UIView *)view ;

//隐藏hud
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view Animated:(BOOL)animated ;

@end
