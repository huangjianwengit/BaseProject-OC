//
//  JHGeneralColor.m
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "JHGeneralColor.h"

@implementation JHGeneralColor

+ (UIColor *)themeColor {
    return [UIColor colorWithHexString:@"#FAAF3B"];
}
+ (UIColor *)themeBackgroundColor
{
    return [UIColor colorWithRed:246 Green:246 Blue:246];
}
+ (UIColor *)navigationBarColor {
    
    return [UIColor colorWithHexString:@"#EE1B2B"];
}

+ (UIColor *)navigationBarTitleColor {
    return [UIColor whiteColor];
}

+ (UIColor *)tabBarTitleNormalColor {
    return [UIColor darkGrayColor];
}

+ (UIColor *)tabBarTitleSelectedColor {
    return[UIColor colorWithHexString:@"#EE1B2B"];
}

+ (UIColor *)seperaterColor {
    return [UIColor groupTableViewBackgroundColor];
}

@end
