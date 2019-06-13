//
//  JHAudioTool.h
//  BaseProject
//
//  Created by qmai on 2019/6/13.
//  Copyright © 2019年 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHAudioTool : NSObject
+(JHAudioTool *)shareAudioTool;
/**
 *播放音乐文件
 */
-(BOOL)playMusic:(NSString *)filename;
/**
 *暂停播放
 */
-(void)pauseMusic:(NSString *)filename;
/**
 *播放音乐文件
 */
-(void)stopMusic:(NSString *)filename;

/**
 *播放音效文件
 */
-(void)playSound:(NSString *)filename;
/**
 *销毁音效
 */
-(void)disposeSound:(NSString *)filename;
/**
 播放音乐完成block
 */
@property (nonatomic,copy) void (^playMusicFinishBlock)(BOOL success);
/**
 播放音效完成block
 */
@property (nonatomic,copy) void (^playSoundFinishBlock)(void);

@end

NS_ASSUME_NONNULL_END
