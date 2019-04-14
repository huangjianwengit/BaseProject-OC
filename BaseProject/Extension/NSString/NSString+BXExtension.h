//
//  NSString+BXExtension.h
//  BXInsurenceBroker
//
//  Created by JYJ on 16/2/23.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (BXExtension)
/**
 *手机号码验证 MODIFIED BY HELENSONG
 */
- (BOOL) isValidateMobile;
///**
// *身份证验证
// */
+ (BOOL)verifyIDCardNumber:(NSString *)value; //验证身份证  
/**
 * 判断字段是否包含空格
 */
- (BOOL)validateContainsSpace;

/**
 *  根据生日返回年龄
 */
- (NSString *)ageFromBirthday;

/**
 *  根据身份证返回岁数
 */
- (NSString *)ageFromIDCard;

/**
 *  根据身份证返回生日
 */
- (NSString*)birthdayFromIDCard;

/**
 *  根据身份证返回性别
 */
- (NSString*)sexFromIDCard;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)stringWithMoneyAmount:(double)amount;

+ (NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end;

//邮箱
+ (BOOL)validateEmail:(NSString *)email;

- (BOOL)isEmptyString;

- (BOOL)isUrl ;
+ (BOOL)isEmpty:(NSString *)string;
/**
 *
 *生成16位随机字母
 */
+(NSString *)generateFradomCharacter;

// 此方法随机产生num位字符串
+(NSString *)retnumbitStringWithNumber:(int)number;
//判断内容是否全部为空格 yes 全部为空格 no 不是

-(BOOL)isEmpty:(NSString *)str;
//IOS 根据文字字符串计算size
+ (CGSize) getAttributeSizeWithText:(NSString *)text fontSize:(int)fontSize;
//json格式字符串转字典：
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
- (NSDictionary *)dictionaryWithJsonString;

/**
 获取App当前名称

 @return App名称
 */
+(NSString*)getAppName;

/**
 获取App 当前版本号
 
 @return App 版本号
 */
+ (NSString*)getAppVersion;
/**
 比较系统版本号
 
 @param version 服务器返回版本号
 @return 是否有新版本
 */
+ (BOOL)compareVesionWithServerVersion:(NSString *)version ;

/**
 根据图片data类型返回图片格式
 */
+ (NSString *)typeForImageData:(NSData *)data ;

//base64解码
+ (NSString *)decodeString:(NSString *)string;
//base64编码
+ (NSString *)encodeString:(NSString *)string;

@end
