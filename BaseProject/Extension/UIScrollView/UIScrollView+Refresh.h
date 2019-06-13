//
//  UIScrollView+MJRefresh.h
//  QiMaiHelper
//
//  Created by qmai on 2019/4/18.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Refresh)

//添加下拉刷新
- (void)QM_addPullToRefreshWithHandler:(void (^)(void))handler;
- (void)QM_triggerPullToRefresh;
- (void)QM_endPullToRefresh;

//添加上拉加载更多
- (void)QM_addPagingRefreshWithHandler:(void (^)(void))handler;
- (void)QM_pagingRefreshNoMoreData;
-(void)QM_endPagingRefresh ;

@end

NS_ASSUME_NONNULL_END
