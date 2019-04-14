//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showMessage:(NSString *)message toView:(UIView *)view;

//window 上显示
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showMessage:(NSString *)message;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view Animated:(BOOL)animated ;

/*可换行的hud*/

+ (void)showMultiLineSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showMultiLineError:(NSString *)error toView:(UIView *)view;
+ (void)showMultiLineMessage:(NSString *)message toView:(UIView *)view;

+ (void)showMultiLineSuccess:(NSString *)success;
+ (void)showMultiLineError:(NSString *)error;
+ (void)showMultiLineMessage:(NSString *)message;

/**
 *    快速显示一条纯文本提示信息
 *    params  delay  延迟 n 秒
 */
+ (void)showFastMessage:(NSString *)message toView:(UIView *)view afterDelay:(NSTimeInterval)delay ;
/**
 *    快速显示一条纯文本提示信息
 */
+ (void)showFastMessage:(NSString *)message toView:(UIView *)view ;

+ (void)showActivityMessage:(NSString*)message;


@end
