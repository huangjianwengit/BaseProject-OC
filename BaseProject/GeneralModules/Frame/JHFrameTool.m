//
//  JHFrameTool.m
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "JHFrameTool.h"
#import "JHSystemTool.h"

@implementation JHFrameTool

+ (CGFloat)iphoneBottomHeight {
    return JHSystemTool.isIphoneX ? 34.0 : 0.0;
}

+ (CGFloat)tabBarHeight {
    return [self iphoneBottomHeight] + 49.0;
}

+ (CGFloat)statusBarHeight {
    return JHSystemTool.isIphoneX ? 44.0 : 20.0;
}

+ (CGFloat)navigationBarHeight {
    return 44.0;
}
+ (CGFloat)navigationBarAndstatusBarHeight
{
    return JHFrameTool.statusBarHeight + JHFrameTool.navigationBarHeight ;
}
+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}
+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}
+ (CGFloat)screenHeightScale {
    return [UIScreen mainScreen].bounds.size.height/667.00;
}
+ (CGFloat)screenWidthScale {
    return [UIScreen mainScreen].bounds.size.width/375.00;
}
@end
