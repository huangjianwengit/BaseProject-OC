//
//  QHCodeButton.m
//  QiHelper
//
//  Created by Jivan on 2020/9/3.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import "QHCodeButton.h"

@implementation QHCodeButton

- (void)addTarget:(id)target action:(SEL)action{
    [super addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
-(void)startCountdown{
    __weak QHCodeButton *btn = self;
    __block int timeout = self.timeOut; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                btn.selected = NO;
                btn.userInteractionEnabled = YES;
            });
        }
        else
        {
            timeout--;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                btn.selected = YES;
                btn.userInteractionEnabled = NO;
                // 设置界面的按钮显示 根据自己需求设置
                [btn setTitle:[NSString stringWithFormat:@"%@秒",strTime] forState:UIControlStateSelected];
                
            });
            
        }
    });
    dispatch_resume(_timer);
}

@end
