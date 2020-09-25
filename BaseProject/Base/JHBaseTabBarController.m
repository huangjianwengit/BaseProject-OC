//
//  JHBaseTabBarController.m
//  BaseProject
//
//  Created by qmai on 2019/4/14.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import "JHBaseTabBarController.h"
#import "JHBaseNavigationController.h"
#import "JHBaseViewController.h"
@interface JHBaseTabBarController ()

@end

@implementation JHBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
}

//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"资讯" andImageName:@"information"];
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"社区" andImageName:@"community"];
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"我的" andImageName:@"personal"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName{
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 选中的颜色由tabbar的tintColor决定
    childVC.tabBarItem.selectedImage =  [[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:JHGeneralColor.themeColor} forState:UIControlStateSelected];
    childVC.title = title;
    JHBaseNavigationController *baseNav = [[JHBaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}

@end
