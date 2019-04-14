//
//  JHBaseNavigationController.m
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "JHBaseNavigationController.h"

@interface JHBaseNavigationController ()<UINavigationBarDelegate>

@end

@implementation JHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self configNavigationBar];
    }
    return self;
}
#pragma mark - private

- (void)configNavigationBar {
    
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = JHGeneralColor.navigationBarColor;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:JHGeneralColor.navigationBarTitleColor, NSFontAttributeName:JHGeneralFont.navigationBarTitleFont}];
    self.navigationBar.tintColor = [UIColor whiteColor];
}

#pragma mark - overwrite

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
