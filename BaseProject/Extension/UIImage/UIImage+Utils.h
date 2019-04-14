//
//  UIImage+Utils.h
//  MagpiesMallUser
//
//  Created by qmai on 2019/3/20.
//  Copyright © 2019年 yiyunteam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Utils)

+(UIImage *)APPIcon ;

+ (UIImage *) getImageFromURL:(NSString *)fileURL;

+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength ;
@end

NS_ASSUME_NONNULL_END
