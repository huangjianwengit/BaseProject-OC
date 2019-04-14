//
//  NSDate+Extension.h
//  Weibo11
//
//  Created by JYJ on 15/12/12.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/// 日期描述字符串
///
/// 格式如下
///     -   刚刚(一分钟内)
///     -   X分钟前(一小时内)
///     -   X小时前(当天)
///     -   昨天 HH:mm(昨天)
///     -   MM-dd HH:mm(一年内)
///     -   yyyy-MM-dd HH:mm(更早期)
- (NSString *)ff_dateDescription;

- (NSString *)getTimeNow;

/**
 判断是否是今天
 */
-(BOOL)isToday;
/**
 判断是否是昨天
 */
-(BOOL)isYesterday;
/**
 判断是否是今年
 */
-(BOOL)isThisyear;

/**
 获得2个时间的时间差
 */
- (NSDateComponents *)deltaFromNow;

-(NSTimeInterval)SecondsFromNow;
/**
 判断一个时间是否比另一个时间早
 */
-(BOOL)isEarlyThanDate:(NSDate *)otherDate;
/**
 完成判断一个时间是否在8:23-11:46之间的功能
 NSDate必须传8：23或23：45之类的格式
 */
- (BOOL)isBetweenFromTime:(NSDate *)fromDate toTime:(NSDate *)toDate;

/**
 *  获取日期的元素对象
 */
-(NSDateComponents*)getDateComponentsFromDate ;



@end



