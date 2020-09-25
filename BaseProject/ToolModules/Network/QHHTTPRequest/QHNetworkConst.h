//
//  QHNetworkConst.h
//  QiHelper
//
//  Created by Jivan on 2020/9/1.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DevelopSever 1
#define TestSever    0
#define ProductSever 0

/** 接口前缀-开发服务器 */
UIKIT_EXTERN NSString *const kApiPrefix;

#pragma mark - 用户
///登录
UIKIT_EXTERN NSString *const loginURL;
///注册
UIKIT_EXTERN NSString *const registerURL;
///获取验证码
UIKIT_EXTERN NSString *const smsCodeURL;
///忘记密码
UIKIT_EXTERN NSString *const resetPasswordURL;
///修改密码
UIKIT_EXTERN NSString *const changePasswordURL;
/// 修改手机号
UIKIT_EXTERN NSString *const changeMobileURL;
/// 修改个人信息
UIKIT_EXTERN NSString *const changeProfileURL;
/// 上传图片
UIKIT_EXTERN NSString *const uploadImageViewURL;
/// 评论列表
UIKIT_EXTERN NSString *const CommentsListURL;
/// 评论回复
UIKIT_EXTERN NSString *const CommentsSendURL;
/// 点赞
UIKIT_EXTERN NSString *const PraiseURL;
/// 文章收藏
UIKIT_EXTERN NSString *const CollectionURL;
/// 我的收藏
UIKIT_EXTERN NSString *const UserCollectionURL;
/// 投诉
UIKIT_EXTERN NSString *const ReportSubmitURL;
/// 拉黑
UIKIT_EXTERN NSString *const BlackSubmitURL;

#pragma mark - 协议
///用户协议
UIKIT_EXTERN NSString *const UserAgreementURL_web;
///隐私协议
UIKIT_EXTERN NSString *const UserprivacyURL_web;
///相机协议
UIKIT_EXTERN NSString *const UserCameraURL_web;
///相册协议
UIKIT_EXTERN NSString *const UserAlbumnURL_web;
///EULA协议
UIKIT_EXTERN NSString *const EulaURL_web;
#pragma mark - 资讯
/// 资讯分类
UIKIT_EXTERN NSString *const NewsCategoryURL;
///资讯列表
UIKIT_EXTERN NSString *const NewsListURL;
///帖子
UIKIT_EXTERN NSString *const CommunityListURL;
///弹窗
UIKIT_EXTERN NSString *const toggleURL;
///盒子下载
UIKIT_EXTERN NSString *const BoxDownURL;
