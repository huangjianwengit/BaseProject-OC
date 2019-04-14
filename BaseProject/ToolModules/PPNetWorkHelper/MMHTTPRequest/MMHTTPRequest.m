//
//  MMHTTPRequest.m
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/4.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import "MMHTTPRequest.h"
#import "PPNetworkHelper.h"
#import <UIKit/UIKit.h>

@implementation MMHTTPRequest

#pragma mark - 具体的接口请求
/** 首页列表数据 */
+ (NSURLSessionTask *)postMainListInfoWithParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,Url_MainList];
    return [self postRequestWithURL:url parameters:parameters success:success failure:failure];
}



#pragma mark - 请求的公共方法
//post请求
+ (NSURLSessionTask *)postRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    // 设置请求头
   
    // 发起请求
    return [PPNetworkHelper POST:URL parameters:parameter success:^(BOOL isSuccess, NSString *status, NSString *hint, NSDictionary *data, NSDictionary *resultDic) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        if (!isSuccess) {
         //code = 0  msg = token不正确
            if ([hint isEqualToString:@"token不正确"]) {
                //进入登录页面
            }
        }
        success(isSuccess,status,hint,data,resultDic);
    } failure:^(NSError *error) {
        // 同上
//        [MBProgressHUD showError:@"请求失败!"];
        failure(error);
    }];
}

//get请求
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL parameters:(NSMutableDictionary *)parameter success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
   
    // 设置请求头
    
    return [PPNetworkHelper GET:URL parameters:parameter success:^(BOOL isSuccess, NSString *status, NSString *hint, NSDictionary *data, NSDictionary *resultDic) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        if (!isSuccess) {
//            [MBProgressHUD showError:hint];
        }
        
        success(isSuccess,status,hint,data,resultDic);
        
    } failure:^(NSError *error) {
        
        failure(error);
    }];
}
@end
