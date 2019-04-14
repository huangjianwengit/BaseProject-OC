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
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"首页" andImageName:@"tab1"];
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"优选" andImageName:@"tab2"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"发红包" andImageName:@"tabbar_add"];
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"商城" andImageName:@"tab3"];
    [self addChildrenViewController:[[JHBaseViewController alloc] init] andTitle:@"个人中心" andImageName:@"tab4"];
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
