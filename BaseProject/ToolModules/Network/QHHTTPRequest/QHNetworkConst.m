//
//  QHNetworkConst.m
//  QiHelper
//
//  Created by Jivan on 2020/9/1.
//  Copyright © 2020 柒贰互娱. All rights reserved.
//

#import "QHNetworkConst.h"

#pragma mark - api前缀

#if DevelopSever
/** 接口前缀-开发服务器（目前正式服务器）*/
NSString *const kApiPrefix = @"http://open.api.07072.com/api/";
#elif TestSever
/** 接口前缀-测试服务器 */
NSString *const kApiPrefix = @"";
#elif ProductSever
/** 接口前缀-生产服务器（代用正式服务器）*/
NSString *const kApiPrefix = @"";
#endif


#pragma mark - 用户
///登录
NSString *const loginURL = @"zv1/user/login";
///注册
NSString *const registerURL = @"zv1/user/register";
///获取验证码
NSString *const smsCodeURL = @"zv1/sms/send";
///忘记密码
NSString *const resetPasswordURL = @"zv1/user/resetpwd";
///修改密码
NSString *const changePasswordURL = @"zv1/user/changepwd";
/// 修改手机号
NSString *const changeMobileURL = @"zv1/user/changemobile";
/// 修改个人信息
NSString *const changeProfileURL = @"zv1/user/profile";
/// 上传图片
NSString *const uploadImageViewURL = @"zv1/common/upload";
/// 评论列表
NSString *const CommentsListURL = @"zv1/Comments/index";
/// 评论回复
NSString *const CommentsSendURL = @"zv1/Comments/write";
/// 点赞
NSString *const PraiseURL = @"zv1/Toolbox/like";
/// 收藏
NSString *const CollectionURL = @"zv1/Toolbox/collect";
/// 我的收藏
NSString *const UserCollectionURL = @"zv1/user/collect";
/// 投诉
NSString *const ReportSubmitURL = @"zv1/Complaint/submit";
/// 拉黑
NSString *const BlackSubmitURL = @"zv1/Toolbox/blacklist";

#pragma mark - 协议
///用户协议
NSString *const UserAgreementURL_web = @"zv1/agreement/index?type=user";
///隐私协议
NSString *const UserprivacyURL_web = @"zv1/agreement/index?type=privacy";
///相机协议
NSString *const UserCameraURL_web = @"zv1/agreement/index?type=camera";
///相册协议
NSString *const UserAlbumnURL_web = @"zv1/agreement/index?type=album";
///EULA协议
NSString *const EulaURL_web = @"zv1/agreement/index?type=eula";
#pragma mark - 资讯
/// 资讯分类
NSString *const NewsCategoryURL = @"zv1//category/index";
///资讯列表
NSString *const NewsListURL = @"zv1//posts/index";
///帖子
NSString *const CommunityListURL = @"zv1/forum/posts";
/// 弹窗
NSString *const toggleURL = @"zv1/updata/is_toggle";
///盒子下载
NSString *const BoxDownURL = @"zv1/updata/boxurl";
