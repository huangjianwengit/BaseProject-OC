//
//  JHFrameTool.h
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define KScrenWithScale  [UIScreen mainScreen].bounds.size.width/375.00
#define KScrenHeightScale  [UIScreen mainScreen].bounds.size.height/667.00

@interface JHFrameTool : NSObject
/** iphone 底部额外的高度 */
+ (CGFloat)iphoneBottomHeight;

/** 标签栏高度 */
+ (CGFloat)tabBarHeight;

/** 状态栏高度 */
+ (CGFloat)statusBarHeight;

/** 导航栏高度 */
+ (CGFloat)navigationBarHeight;
/** 屏幕宽度 */
+ (CGFloat)screenWidth;
/** 屏幕高度 */
+ (CGFloat)screenHeight;

/**导航栏和状态栏高度*/
+ (CGFloat)navigationBarAndstatusBarHeight;
@end

NS_ASSUME_NONNULL_END
