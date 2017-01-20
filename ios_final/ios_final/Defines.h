

#if (DEBUG || TESTCASE)
#define FxLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define FxLog(format, ...)
#endif

// 日志输出宏
#define BASE_LOG(cls,sel) FxLog(@"%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel))
#define BASE_ERROR_LOG(cls,sel,error) FxLog(@"ERROR:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), error)
#define BASE_INFO_LOG(cls,sel,info) FxLog(@"INFO:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), info)

// 日志输出函数
#if (DEBUG || TESTCASE)
#define BASE_LOG_FUN()         BASE_LOG([self class], _cmd)
#define BASE_ERROR_FUN(error)  BASE_ERROR_LOG([self class],_cmd,error)
#define BASE_INFO_FUN(info)    BASE_INFO_LOG([self class],_cmd,info)
#else
#define BASE_LOG_FUN()
#define BASE_ERROR_FUN(error)
#define BASE_INFO_FUN(info)
#endif


// 设备类型判断
#define IsiPad     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsiPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IsRetain   ([[UIScreen mainScreen] scale] >= 2.0)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define ScreenMaxLength (MAX(ScreenWidth, ScreenHeight))
#define ScreenMinLength (MIN(ScreenWidth, ScreenHeight))

#define IsiPhone4   (IsiPhone && ScreenMaxLength < 568.0)
#define IsiPhone5   (IsiPhone && ScreenMaxLength == 568.0)
#define IsiPhone6   (IsiPhone && ScreenMaxLength == 667.0)
#define IsiPhone6P  (IsiPhone && ScreenMaxLength == 736.0)

// 设置颜色值
#define RgbColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define BtnNormalColor  RgbColor(222, 105, 55)
#define BtnSelectColor  [UIColor lightGrayColor]

// 消息通知
#define RegisterNotify(_name, _selector)                    \
[[NSNotificationCenter defaultCenter] addObserver:self  \
selector:_selector name:_name object:nil];

#define RemoveNofify            \
[[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
[[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];

/*网络相关
 {"status":"OK", "business":[]}
 {"status":"ERROR","error":{"errorCode":10003,"errorMessage":"Invalid appkey. (appkey参数值无效)"}}
 */
#define NetResult           @"status"
#define NetOk               @"ok"
#define NetError            @"error"
#define NetErrorMessage     @"errorMessage"
#define HTTPSchema          @"http:"
#define HTTPGET             @"GET"
#define HTTPPOST            @"POST"
#define FxRequestTimeout    10

// iOS系统版本
#define IOSBaseVersion8     8.0
#define IOSBaseVersion7     7.0
#define IOSBaseVersion6     6.0


// 其他常量
#define AnimationSecond     1.0
#define NavBarHeight        44
#define NavBarHeight7       64
#define LocationDistance    100

// 文件缓存路径
#define RootPath            @"/Library/.GroupPurchaseEarn"
#define CacheImagePath      @"CacheImages"
#define ShangHuIconPrex     @"ShangHuIcon_%@"
#define DBFile              @"GroupEarn.db"

// 消息通知Key
#define NofifyShangHuIcon   @"ShangHuIcon"

// 字符串定义
#define CitySuffix          @"市市辖区"

// 提示信息
#define LoadingTip          @"加载中..."
#define ShareFmt            @"我在团团赚看到\'%@\',希望和你分享，地址：%@，电话：%@，网址：%@"
#define ShareTuanGouFmt     @"我在团团赚看到\'%@\',希望和你分享，网址：%@"
#define DetailTitle         @"商家详情"
#define TuanGouTitle        @"团购详情"
#define MoreInfos           @"更多商家信息"
#define MoreDianPin         @"商家点评信息"

// 短信提示
#define SendSMSMessage      @"短信已发送！\r\n赶快让他们去看吧！"
#define SendSMSFail         @"短信发送失败"
#define SendSMSUnknown      @"系统未知错误"
#define SendSMSSetting      @"请先设置iMessage账号"

// 邮件提示
#define TipSetEmailAccount  @"请先设置电子邮件账号"

// 微博定义
#define WeiBoAppKey         @"1589741968"
#define WeiBoRedirectURI    @"https://api.weibo.com/oauth2/default.html"
