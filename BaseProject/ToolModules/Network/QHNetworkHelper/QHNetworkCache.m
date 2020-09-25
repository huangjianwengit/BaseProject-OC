//
//  QHNetworkCache.m
//  QiHelper
//
//  Created by Jivan on 2020/8/31.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import "QHNetworkCache.h"
#import "YYCache.h"

static NSString *const kPPNetworkResponseCache = @"kQHNetworkResponseCache";

@implementation QHNetworkCache

+ (void)setHttpCache:(id)httpData URL:(NSString *)URL parameters:(NSDictionary *)parameters {
    NSString *cacheKey = [self cacheKeyWithURL:URL parameters:parameters];
    //异步缓存,不会阻塞主线程
    [[self dataCache] setObject:httpData forKey:cacheKey withBlock:nil];
}

+ (id)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters {
    NSString *cacheKey = [self cacheKeyWithURL:URL parameters:parameters];
    return [[self dataCache] objectForKey:cacheKey];
}

+ (NSInteger)getAllHttpCacheSize {
    return [[self dataCache].diskCache totalCost];
}

+ (void)removeAllHttpCache {
    [[self dataCache].diskCache removeAllObjects];
}

+ (YYCache *)dataCache {
    return [YYCache cacheWithName:kPPNetworkResponseCache];
}

+ (NSString *)cacheKeyWithURL:(NSString *)URL parameters:(NSDictionary *)parameters {
    if(!parameters){return URL;};
    // 将参数字典转换成字符串
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *paraString = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    // 将URL与转换好的参数字符串拼接在一起,成为最终存储的KEY值
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@",URL,paraString];
    
    return cacheKey;
}

@end

