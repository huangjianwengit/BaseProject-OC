//
//  JHGeneralColor.h
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHGeneralColor : NSObject

/** 主题色 */
+ (UIColor *)themeColor;

/** 主题背景色 */
+ (UIColor *)themeBackgroundColor;

/** 导航栏颜色 */
+ (UIColor *)navigationBarColor;

/** 导航栏标题颜色 */
+ (UIColor *)navigationBarTitleColor;

/** 标签栏标题选中颜色 */
+ (UIColor *)tabBarTitleSelectedColor;

/** 标签栏标题正常颜色 */
+ (UIColor *)tabBarTitleNormalColor;

/** 分割线的颜色 */
+ (UIColor *)seperaterColor;

@end

NS_ASSUME_NONNULL_END
