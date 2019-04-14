//
//  JHSystemTool.h
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHSystemTool : NSObject

/** 判断是否是 iphoneX 系列 */
+ (BOOL)isIphoneX;

/** app 版本号 */
+ (NSString *)appVersion;

/** app 名称 */
+ (NSString *)appName;

@end

NS_ASSUME_NONNULL_END
