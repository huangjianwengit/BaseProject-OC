//
//  UIScrollView+MJRefresh.m
//  QiMaiHelper
//
//  Created by qmai on 2019/4/18.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
//添加下拉刷新
- (void)QM_addPullToRefreshWithHandler:(void (^)(void))handler {
    if (!self.mj_header) {
        MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:handler];
        refreshHeader.lastUpdatedTimeLabel.hidden = YES;
        self.mj_header = refreshHeader;
    }
}

//开始刷新
- (void)QM_triggerPullToRefresh {
    [self.mj_footer endRefreshing];
    [self.mj_header beginRefreshing];
    self.mj_footer.hidden = YES;
}

//结束下拉刷新
- (void)QM_endPullToRefresh {
    [self.mj_header endRefreshing];
    [self.mj_footer resetNoMoreData];
    self.mj_footer.hidden = NO;
}
//结束上拉刷新
-(void)QM_endPagingRefresh
{
    [self.mj_footer endRefreshing];
    self.mj_header.hidden = NO;
}
//添加上拉加载更多
- (void)QM_addPagingRefreshWithHandler:(void (^)(void))handler {
    if (!self.mj_footer) {
        MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:handler];
        self.mj_footer = refreshFooter;
    }
}

//显示已经全部加载完毕
- (void)QM_pagingRefreshNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

@end
