//
//  MMHTTPRequest.h
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/4.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMNetworkConst.h"

NS_ASSUME_NONNULL_BEGIN

/**
 请求成功的block
 @param data   这个可能会是数组、字典类型
 @param resultDic 响应体数据
 */
typedef void(^PPRequestSuccess)(BOOL success, NSString *status, NSString *hint,  id data, NSDictionary *resultDic); //blcok写成这种样式的好处是，一处修改了，其他地方都不要动了，全部修改
/**
 请求失败的block
 
 @param error 扩展信息
 */
typedef void(^PPRequestFailure)(NSError *error);

@interface MMHTTPRequest : NSObject


#pragma mark - 首页
/** 首页领取红包 参数: id  红包记录id 用户user_id */
+ (NSURLSessionTask *)postSetRedBagInfoWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure ;

@end

NS_ASSUME_NONNULL_END
