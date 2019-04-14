//
//
//  XYWKWebViewController.m
//  WKWebViewDemo
//
//  Created by 渠晓友 on 2018/6/28.
//
//  Copyright © 2018年 xiaoyouPrince. All rights reserved.
//

#import "XYWKWebViewController.h"
#import "XYWKTool.h"
#import <Masonry.h>
@interface XYWKWebViewController ()

@property(nonatomic , strong) UIView  *HUD;
@property(nonatomic , strong) UIProgressView  *progressView;
@property (nonatomic,strong) UIButton *closeBtn ;

@end

@implementation XYWKWebViewController

#pragma mark - Life Circle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _showHudWhenLoading = YES;
        _shouldShowProgress = YES;
        _isUseWebPageTitle = YES;
        _alwaysAllowSideBackGesture = YES;
        _scrollEnabled = YES;
    }
    
    return self;
}

- (void)loadView
{
    // 直接自定义WebView为self.view
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    [config.userContentController addUserScript:[self getUserScript]];
   
    _webView = [[XYWKWebView alloc]initWithFrame:CGRectZero configuration:config];
    _webView.scrollView.scrollEnabled = _scrollEnabled;
    _webView.xy_messageHandlerDelegate = self;
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    self.view = _webView;
}
//禁用webView长按弹出copy...菜单
-(WKUserScript *)getUserScript
{
    // 禁止选择CSS
    NSString *css = @"body{-webkit-user-select:none;-webkit-user-drag:none;}";
    
    // CSS选中样式取消
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"var style = document.createElement('style');"];
    [javascript appendString:@"style.type = 'text/css';"];
    [javascript appendFormat:@"var cssContent = document.createTextNode('%@');", css];
    [javascript appendString:@"style.appendChild(cssContent);"];
    [javascript appendString:@"document.body.appendChild(style);"];
    // javascript注入
    WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    return noneSelectScript ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"加载中";
    self.closeBtn.hidden = NO ;
    if (self.shouldShowProgress) {
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    if (self.isUseWebPageTitle) {
        [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    if (self.url.length) {
        [self.webView loadRequestWithRelativeUrl:self.url];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.closeBtn setHidden:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     [self.closeBtn setHidden:YES];
    [self hideLoadingProgressView];
    [self hideHUD];
    
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

- (void)dealloc {
    
    XYWKLog(@"dealloc --- %@",NSStringFromClass([self class]));
    if (self.shouldShowProgress) {
        [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    }
    
    if (self.isUseWebPageTitle) {
        [self.webView removeObserver:self forKeyPath:@"title"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)YBGeneral_clickBackItem:(UIBarButtonItem *)item
{
    if (self.webView.canGoBack) {
        //web页面返回
        [self.webView goBack];
    }
    else{
        //vc页面返回
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - UI

- (UIProgressView *)progressView
{
    if (_progressView == nil) {
         CGRect frame = CGRectMake(0,0, XYWKScreenW, 5);
        _progressView = [[UIProgressView alloc] initWithFrame:frame];
    }
    return _progressView;
}
-(UIButton *)closeBtn
{
    if (!_closeBtn) {
      
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"关闭" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.navigationController.navigationBar addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.navigationController.navigationBar);
                make.height.equalTo(@30);
                make.width.equalTo(@50);
                make.left.equalTo(self.navigationController.navigationBar).offset(50);
            }];
            [button addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        _closeBtn = button ;
        }
    return _closeBtn ;
}

- (void)hideLoadingProgressView{
    [self.progressView removeFromSuperview];
    self.progressView = nil;
}

- (void)showLoadingProgress:(CGFloat)progress andTintColor:(UIColor *)color{
    
    if (!self.progressView.superview) {
        [self.view addSubview:self.progressView];
    }
    self.progressView.progress = progress;
    self.progressView.tintColor = color;
    
    // 如果progress = 1.0 自动移除
    if(progress == 1.0f)
    {
        [self hideLoadingProgressView];
    }
}

- (UIView *)HUD{
    if (_HUD == nil) {
        _HUD = [UIView new];
        _HUD.frame = CGRectMake(50, 0, XYWKScreenW - 100, XYWKScreenH);
        _HUD.backgroundColor  = [UIColor clearColor];
        
        UILabel *tip = [UILabel new];
        tip.text = @"正在加载...";
        tip.textAlignment = NSTextAlignmentCenter;
        [_HUD addSubview:tip];
        tip.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        CGFloat X = _HUD.frame.size.width/4;
        CGFloat width = _HUD.frame.size.width/2;
        CGFloat height = 50;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            tip.frame = CGRectMake(X, XYWKScreenH/2 - 100, width, height);
        });
        tip.layer.cornerRadius = 5;
        tip.clipsToBounds = YES;
    }
    return _HUD;
}

- (void)showHUD{
    if (!self.HUD.superview) {
        [self.view addSubview:self.HUD];
    }
}

- (void)hideHUD{
    [self.HUD removeFromSuperview];
    self.HUD = nil;
}


#pragma mark -- setters
// 设置内部的WebView是否可以允许系统左滑返回之前浏览页面的功能
- (void)setAlwaysAllowSideBackGesture:(BOOL)alwaysAllowSideBackGesture{
    self.webView.allowsBackForwardNavigationGestures = alwaysAllowSideBackGesture;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        if (object == self.webView) {
            if (self.showHudWhenLoading) {
                [self showLoadingProgress:self.webView.estimatedProgress andTintColor:[UIColor colorWithRed:24/255.0 green:124/255.0 blue:244/255.0f alpha:1.0]];
            }
        }
        else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else if ([keyPath isEqualToString:@"title"]){
        if (object == self.webView) {
            if ([self isUseWebPageTitle]) {
              self.title = self.webView.title;
            }
        }
        else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - SHWKWebViewMessageHandleDelegate

- (void)xy_webView:(XYWKWebView *)webView didReceiveScriptMessage:(XYScriptMessage *)message
{
    XYWKLog(@"webView method:%@ params:%@",message.method,message.params);
    
    if ([message.method isEqualToString:@"share"]) {
        //JS 调用原生分享
        [XYWKTool shareWithMessage:message ParentView:self.webView];
    }
    if ([message.method isEqualToString:@"navigation"]) {
        //JS 调用原生导航
        [XYWKTool shareWithMessage:message ParentView:self.webView];
    }
    
}


#pragma mark - WKNavigationDelegate

/**
 *  页面开始加载时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    if (_showHudWhenLoading) {
        [self showHUD];
    }
    
    XYWKLog(@"%s：%@", __FUNCTION__,webView.URL);
}

/**
 *  当内容开始返回时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    XYWKLog(@"%s", __FUNCTION__);
  
}

/**
 *  页面加载完成之后调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [self hideHUD];
    
    // 实际上是首页加载完成之后就会走这个方法
    XYWKLog(@"%s 这个页面加载完成了",__func__);
    
}

/**
 *  加载失败时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 *  @param error      错误
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    XYWKLog(@"%s%@", __FUNCTION__,error);
    
    [self hideLoadingProgressView];
    [self hideHUD];
}

/**
 *  接收到服务器跳转请求之后调用
 *
 *  @param webView      实现该代理的webview
 *  @param navigation   当前navigation
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
    XYWKLog(@"%s", __FUNCTION__);
    // 这里进行重定向了，例如 网页内下载APP 链接，起初是https://地址。重定向之后itms-appss:// 这里需要重新让WebView加载一下
    NSString *redirectionUrlScheme = webView.URL.scheme;
    if ([redirectionUrlScheme isEqualToString:@"itms-appss"]) {
        [XYWKTool jumpToAppStoreFromVc:self withUrl:webView.URL];
    }
}

/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    XYWKLog(@"%s", __FUNCTION__);
  
 decisionHandler(WKNavigationResponsePolicyAllow);
}

/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    XYWKLog(@"URL: %@", navigationAction.request.URL.absoluteString);
        
}





- (NSString *)valueForParam:(NSString *)param inUrl:(NSURL *)url {
    
    NSArray *queryArray = [url.query componentsSeparatedByString:@"&"];
    for (NSString *params in queryArray) {
        NSArray *temp = [params componentsSeparatedByString:@"="];
        if ([[temp firstObject] isEqualToString:param]) {
            return [temp lastObject];
        }
    }
    return @"";
}

- (NSMutableDictionary *)paramsOfUrl:(NSURL *)url {
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
    
    NSArray *queryArray = [url.query componentsSeparatedByString:@"&"];
    for (NSString *params in queryArray) {
        NSArray *temp = [params componentsSeparatedByString:@"="];
        NSString *key = [temp firstObject];
        NSString *value = temp.count == 2 ? [temp lastObject]:@"";
        [paramDict setObject:value forKey:key];
    }
    return paramDict;
}

- (NSString *)stringByJoinUrlParams:(NSDictionary *)params {
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *key in params.allKeys) {
        [arr addObject:[NSString stringWithFormat:@"%@=%@",key,params[key]]];
    }
    return [arr componentsJoinedByString:@"&"];
}

- (NSString *)urlWithoutQuery:(NSURL *)url {
    NSRange range = [url.absoluteString rangeOfString:@"?"];
    if (range.location != NSNotFound) {
        return [url.absoluteString substringToIndex:range.location];
    }
    return url.absoluteString;
}

#pragma mark - WKUIDelegate

/**
 *  处理js里的alert
 *
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 *  处理js里的confirm
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
