//
//  NSDate+Extension.m
//  Weibo11
//
//  Created by JYJ on 15/12/12.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString *)ff_dateDescription {
    
    // 1. 获取当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 2. 判断是否是今天
    if ([calendar isDateInToday:self]) {
        
        NSInteger interval = ABS((NSInteger)[self timeIntervalSinceNow]);

        if (interval < 60) {
            return @"刚刚";
        }
        interval /= 60;
        if (interval < 60) {
            return [NSString stringWithFormat:@"%zd 分钟前", interval];
        }
        
        return [NSString stringWithFormat:@"%zd 小时前", interval / 60];
    }
    
    // 3. 昨天
    NSMutableString *formatString = [NSMutableString stringWithString:@" HH:mm"];
    if ([calendar isDateInYesterday:self]) {
        [formatString insertString:@"昨天" atIndex:0];
    } else {
        [formatString insertString:@"MM-dd" atIndex:0];
        
        // 4. 是否当年
        NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self toDate:[NSDate date] options:0];

        if (components.year != 0) {
            [formatString insertString:@"yyyy-" atIndex:0];
        }
    }

    // 5. 转换格式字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    fmt.dateFormat = formatString;
    
    return [fmt stringFromDate:self];
}
- (NSString *)getTimeNow
{
    NSString* date;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    //[formatter setDateFormat:@"YYYY.MM.dd.hh.mm.ss"];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    date = [formatter stringFromDate:[NSDate date]];
    NSString* timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    NSLog(@"%@", timeNow);
    return timeNow;
}
-(BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitMonth;
    NSDateComponents *selfDateComponents = [calendar components:unit fromDate:self];
    NSDateComponents *nowDateComponents = [calendar components:unit fromDate:[NSDate date]];
    
    return (selfDateComponents.year == nowDateComponents.year &&selfDateComponents.month == nowDateComponents.month && selfDateComponents.day == nowDateComponents.day);
    
}
-(BOOL)isYesterday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *now = [NSDate date];
    NSString *nowStr = [dateFormatter stringFromDate:now];
    NSDate *nowDate=[dateFormatter dateFromString:nowStr];
    NSString *selfStr = [dateFormatter stringFromDate:self];
    NSDate *selfDate = [dateFormatter dateFromString:selfStr];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    
    return components.day == 1;
    
}
-(BOOL)isThisyear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear;
    NSDateComponents *selfDateComponents = [calendar components:unit fromDate:self];
    NSDateComponents *nowDateComponents = [calendar components:unit fromDate:[NSDate date]];
    return selfDateComponents.year == nowDateComponents.year;
    
}
- (NSDateComponents *)deltaFromNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
    
}

-(NSTimeInterval)SecondsFromNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
     NSDateComponents *componets = [calendar components:unit fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
    NSTimeInterval sec = [componets hour]*3600+[componets minute]*60+[componets second];
    return sec ;
}
- (BOOL)isEarlyThanDate:(NSDate *)otherDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *d= [calendar components:unit fromDate:otherDate toDate:self options:NSCalendarWrapComponents];
    long sec = [d hour]*3600+[d minute]*60+[d second];
    
    if (sec >= 900) {
        return NO;
    }else
    {
        return YES;
    }
    
    
    
}
- (BOOL)isBetweenFromTime:(NSDate *)fromDate toTime:(NSDate *)toDate
{
    NSDateFormatter *dateF1 = [[NSDateFormatter alloc]init];
    dateF1.dateFormat = @"HH";
    NSString *fromHour = [dateF1 stringFromDate:fromDate];
    
    NSDateFormatter *dateF2 = [[NSDateFormatter alloc]init];
    dateF2.dateFormat = @"mm";
    NSString *fromMinute = [dateF2 stringFromDate:fromDate];
    
    NSInteger minuteTotalFromBegin = [fromHour integerValue] * 60+[fromMinute integerValue];
    
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    dateF.dateFormat = @"HH:mm";
    NSString *tempNow = [dateF stringFromDate:self];
    NSDate *nowDate = [dateF dateFromString:tempNow];
    
    NSString *fromHourNow = [dateF1 stringFromDate:nowDate];
    
    NSString *fromMinuteNow = [dateF2 stringFromDate:nowDate];
    
    NSInteger minuteTotalFromNow = [fromHourNow integerValue] * 60+[fromMinuteNow integerValue];
    
    NSString *toHourEnd = [dateF1 stringFromDate:toDate];
    
    NSString *toMinuteEnd = [dateF2 stringFromDate:toDate];
    
    NSInteger minuteTotalFromEnd = [toHourEnd integerValue] * 60+[toMinuteEnd integerValue];
    if (minuteTotalFromBegin < minuteTotalFromEnd) {
        if (minuteTotalFromNow >=minuteTotalFromBegin && minuteTotalFromNow <=minuteTotalFromEnd) {
            return YES;
        }else
        {
            return NO;
        }
    }else
    {
        if ((minuteTotalFromNow >=minuteTotalFromBegin && minuteTotalFromNow <= 24*60) ||(minuteTotalFromNow >= 0 && minuteTotalFromNow <= minuteTotalFromEnd)  ) {
            return YES;
        }else
        {
            return NO;
        }
        
        
        
    }
    
    
}

-(NSDateComponents*)getDateComponentsFromDate{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Beijing"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    
    return theComponents ;
    
}

@end
