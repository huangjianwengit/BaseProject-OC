//
//  QHHTTPRequest.m
//  QiHelper
//
//  Created by Jivan on 2020/9/1.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import "QHHTTPRequest.h"
#import "QHNetworkHelper.h"

@implementation QHHTTPRequest

#pragma mark - 请求的公共方法

//POST请求 - 无缓存
+ (NSURLSessionTask *)postRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(QHRequestSuccess)success failure:(QHRequestFailure)failure{
    //开启日志打印
    [QHNetworkHelper openLog];
    //插入APPKey
    NSDate *date = [NSDate date];
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
    [parameter setObject:timeStr forKey:@"time"];
    NSDictionary *headers = @{@"Content-Type":@"application/json"};
    // 发起请求
    return [QHNetworkHelper POST:URL parameters:parameter headers:headers success:^(id responseObject){
        [QHHTTPRequest commonSuccessDataWithObject:responseObject handler:success];
    } failure:^(NSError *error) {
        [QHHTTPRequest commonFailureWithFailure:error handle:failure];
    }];
}
//GET请求 - 无缓存
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(QHRequestSuccess)success failure:(QHRequestFailure)failure{
    //开启日志打印
    [QHNetworkHelper openLog];
    //插入APPKey
    NSDate *date = [NSDate date];
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
    [parameter setObject:timeStr forKey:@"time"];
    
    NSDictionary *headers = @{@"Content-Type":@"application/json"};
    // 发起请求
    return [QHNetworkHelper GET:URL parameters:parameter headers:headers success:^(id responseObject) {
        [QHHTTPRequest commonSuccessDataWithObject:responseObject handler:success];
    } failure:^(NSError *error) {
        [QHHTTPRequest commonFailureWithFailure:error handle:failure];
    }];
}

//POST请求 - 自动缓存
+ (NSURLSessionTask *)postCachetRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(QHRequestSuccess)success failure:(QHRequestFailure)failure{
    //开启日志打印
    [QHNetworkHelper openLog];
    //插入APPKey
    NSDate *date = [NSDate date];
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
    [parameter setObject:timeStr forKey:@"time"];
    NSDictionary *headers = @{@"Content-Type":@"application/json"};
    // 发起请求
    return [QHNetworkHelper POST:URL parameters:parameter headers:headers responseCache:^(id responseCache) {
        if (responseCache) {
            [QHHTTPRequest commonSuccessDataWithObject:responseCache handler:success];
        }
    } success:^(id responseObject) {
        [QHHTTPRequest commonSuccessDataWithObject:responseObject handler:success];
    } failure:^(NSError *error) {
        [QHHTTPRequest commonFailureWithFailure:error handle:failure];
    }];
}
//GET请求 - 自动缓存
+ (NSURLSessionTask *)geCachetRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(QHRequestSuccess)success failure:(QHRequestFailure)failure{
    //开启日志打印
    [QHNetworkHelper openLog];
    //插入APPKey
    NSDate *date = [NSDate date];
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
    [parameter setObject:timeStr forKey:@"time"];
    
    NSDictionary *headers = @{@"Content-Type":@"application/json"};
    // 发起请求
    return [QHNetworkHelper GET:URL parameters:parameter headers:headers responseCache:^(id responseCache) {
        if (responseCache) {
            [QHHTTPRequest commonSuccessDataWithObject:responseCache handler:success];
        }
    } success:^(id responseObject) {
        [QHHTTPRequest commonSuccessDataWithObject:responseObject handler:success];
    } failure:^(NSError *error) {
        [QHHTTPRequest commonFailureWithFailure:error handle:failure];
    }];
}

// 上传图片
+ (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL parameters:(id)parameters name:(NSString *)name images:(NSArray<UIImage *> *)images fileNames:(NSArray<NSString *> *)fileNames imageScale:(CGFloat)imageScale imageType:(NSString *)imageType progress:(QHRequestProgress)uploadProgress success:(QHRequestSuccess)success failure:(QHRequestFailure)failure{
    //开启日志打印
    [QHNetworkHelper openLog];
    //插入APPKey
    NSDate *date = [NSDate date];
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]];
    [parameters setObject:timeStr forKey:@"time"];
    //设置请求头
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:@"multipart/from-data" forKey:@"enctype"];
    
    return [QHNetworkHelper uploadImagesWithURL:URL parameters:parameters headers:headers name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:^(NSProgress *progress) {
        uploadProgress?uploadProgress(progress):nil;
    } success:^(id responseObject) {
        [QHHTTPRequest commonSuccessDataWithObject:responseObject handler:success];
    } failure:^(NSError *error) {
        [QHHTTPRequest commonFailureWithFailure:error handle:failure];
    }];
    
}
#pragma mark - private method
///公共返回数据处理
+(void)commonSuccessDataWithObject:(id)responseObject handler:(QHRequestSuccess)handler{
    [MBProgressHUD hideHUD];
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        
        NSString *status = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        NSString *msg = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"msg"]];
        id data = responseObject;
        id resultData = [responseObject objectForKey:@"data"];
        BOOL isSuccess = [status isEqualToString:@"200"];
        !isSuccess?[MBProgressHUD showError:msg]:nil;
        
        if ([resultData isKindOfClass:[NSDictionary class]]) {
            handler?handler(isSuccess,status,msg,data,resultData):nil;
        }else{
            handler?handler(isSuccess,status,msg,data,[NSDictionary dictionary]):nil;
        }
    }else{
        
        NSString *status = @"200";
        NSString *msg = @"无效返回数据格式";
        id data = nil;
        BOOL isSuccess = NO;
        [MBProgressHUD showError:msg];
        handler?handler(isSuccess,status,msg,data,data):nil;
    }
}
+(void)commonFailureWithFailure:(NSError *)error handle:(QHRequestFailure)failureHandle{
    [MBProgressHUD hideHUD];
    [MBProgressHUD showError:error.localizedFailureReason];
    failureHandle ? failureHandle(error):nil;
}

@end
