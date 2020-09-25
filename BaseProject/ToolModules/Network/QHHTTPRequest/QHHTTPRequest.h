//
//  QHHTTPRequest.h
//  QiHelper
//
//  Created by Jivan on 2020/9/1.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QHNetworkConst.h"

NS_ASSUME_NONNULL_BEGIN


/**
 请求成功的block
 @param data   这个可能会是数组、字典类型
 @param resultDic 响应体数据
 */
typedef void(^QHRequestSuccess)(BOOL success, NSString *status, NSString *hint, id data, NSDictionary *resultDic); //blcok写成这种样式的好处是，一处修改了，其他地方都不要动了，全部修改
/**
 请求失败的block
 
 @param error 扩展信息
 */
typedef void(^QHRequestFailure)(NSError *error);

// 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小
typedef void (^QHRequestProgress)(NSProgress *progress);

@interface QHHTTPRequest : NSObject

@end

NS_ASSUME_NONNULL_END
