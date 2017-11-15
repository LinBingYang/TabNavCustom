//
//  BaseViewController.m
//  BaseVC
//
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width
#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])

#define StatusbarSize ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 状态栏高度相比之前
#define S_Height (iPhoneX ? 24.f : 0.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (50.f+34.f) : 50.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#define SizeScale (kHeight != 414 ?1 :1.2)

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "MainController.h"
@interface BaseViewController ()
{
    float _nSpaceNavY;
}
@end

@implementation BaseViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f,kWidth, 0.f)];
    _nSpaceNavY = STATUS_BAR_HEIGHT;
    
    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)
    {
        _statusBarView.frame = CGRectMake(_statusBarView.frame.origin.x, _statusBarView.frame.origin.y, _statusBarView.frame.size.width, STATUS_BAR_HEIGHT);
        _statusBarView.backgroundColor = [UIColor clearColor];
        ((UIImageView *)_statusBarView).backgroundColor = [UIColor clearColor];
        [self.view addSubview:_statusBarView];
        _nSpaceNavY = 0;
    }

}


/*
 
 创建导航栏,
 szTitle为导航栏标题，如果导航栏要调整为非标题样式，可写为 @"" ;
 
 bgIndex为自定义导航栏样式（可按需求自定义）,传 0 背景色为灰色，传 1 在导航栏上添加一张图片，如果图片尺寸不符，请自行添加一个UIImageView，添加在self.navIV上，传 2 导航栏为黑色（按需求自定义）,传 3 横屏时使用 ;
 
 titleIndex为改变导航栏标题样式（同样按需求自定义）,传 0 黑色字体，传 1 白色字体 传其他值 横屏使用 ;
 
 menuItem 在导航栏添加其他控件，详细可见控制器代码。
 
 */

- (void)createNavWithTitle:(NSString *)szTitle selectNavBgImgIndex:(NSInteger )bgIndex  selectedTitleColorIndex:(NSInteger)titleIndex  createMenuItem:(UIView *(^)(int nIndex))menuItem
{
    
    self.navIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, _nSpaceNavY, kWidth, NAVIGATION_BAR_HEIGHT - _nSpaceNavY)];
    if(bgIndex==0){
        
        [self.navIV setBackgroundColor:[UIColor grayColor]];
        
    }else if(bgIndex==1){
        
        _titleImage = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth - 56)/2, (44 - 17)/2+18, 56, 17)];
        [self.navIV addSubview:_titleImage];
        
    }else if (bgIndex == 2) {
        
        [self.navIV setBackgroundColor:[UIColor blackColor]];
        
    }else if (bgIndex == 3) {
        
        //横屏
//        self.navIV.frame =CGRectMake(0, _nSpaceNavY, self.view.frame.size.height, 64 - _nSpaceNavY);
//        [self.navIV setBackgroundColor:[UIColor blackColor]];
        
    }
    [self.view addSubview:self.navIV];
    
    /* { 导航条 } */
    _navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, StatusbarSize,kWidth, 44.f)];
    ((UIImageView *)_navView).backgroundColor = [UIColor clearColor];
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    UILabel *titleLabel;
    if (szTitle != nil)
    {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (_navView.frame.size.height - 40)/2, kWidth, 40)];
        [titleLabel setText:szTitle];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        if(titleIndex==0){
            [titleLabel setTextColor:[UIColor blackColor]];
        }else if(titleIndex == 1){
            [titleLabel setTextColor:[UIColor whiteColor]];
        }else {
            //横屏
            _navView.frame = CGRectMake(0, StatusbarSize, kHeight, 44.f);
            titleLabel.frame = CGRectMake((kHeight - 200)/2, 2, 200, 40);
            [titleLabel setText:szTitle];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            [titleLabel setTextColor:[UIColor whiteColor]];
        }
        [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [_navView addSubview:titleLabel];
    }
    self.titleLabel=titleLabel;
    UIView *item1 = menuItem(0);
    if (item1 != nil)
    {
        [_navView addSubview:item1];
    }
    UIView *item2 = menuItem(1);
    if (item2 != nil)
    {
        [_navView addSubview:item2];
    }
    UIView *item3 = menuItem(2);
    if (item3 != nil)
    {
        [_navView addSubview:item3];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//呈现主页面
-(void)presentMainView
{
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController=[MainController new];
}


@end
