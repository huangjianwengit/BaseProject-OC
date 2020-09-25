//
//  QHCodeButton.h
//  QiHelper
//
//  Created by Jivan on 2020/9/3.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QHCodeButton : UIButton

/// 设置超时时间
@property (nonatomic) int timeOut;
/// 倒计时
- (void)startCountdown;

- (void)addTarget:(id)target action:(SEL)action;



@end

NS_ASSUME_NONNULL_END
