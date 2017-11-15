//
//  MainController.m
//  SinnaWeiBoDemo
//


#import "MainController.h"
#import "Dock.h"
#import "BaseNavigationController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "TestThreeViewController.h"
#import "TestFourViewController.h"
@interface MainController ()<DockDelegate,UINavigationControllerDelegate>

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.初始化所有子控制器控志器
    
    [self addChildViewControll];
    
    //初始化DockItem
    [self addDockItem];
    
}
-(void)addChildViewControll
{
    //1.
    TestOneViewController *oneVC=[[TestOneViewController alloc] init];
    BaseNavigationController *oneNav=[[BaseNavigationController alloc] initWithRootViewController:oneVC];
    oneNav.delegate=self;
    [self addChildViewController:oneNav];
    
    //2.
    TestTwoViewController *twoVC=[[TestTwoViewController alloc] init];
    BaseNavigationController *twoNav=[[BaseNavigationController alloc] initWithRootViewController:twoVC];
    twoNav.delegate=self;
    [self addChildViewController:twoNav];

    //3.
    TestThreeViewController *threeVC=[[TestThreeViewController alloc] init];
    BaseNavigationController *threeNav=[[BaseNavigationController alloc] initWithRootViewController:threeVC];
    threeNav.delegate=self;
    [self addChildViewController:threeNav];

    //4.
    TestFourViewController *fourVC=[[TestFourViewController alloc] init];
    BaseNavigationController *fourNav=[[BaseNavigationController alloc] initWithRootViewController:fourVC];
    fourNav.delegate=self;
    [self addChildViewController:fourNav];

}
#pragma mark  UInavgationDelegate
//导航控制器即将展示新的控制器
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root=navigationController.viewControllers[0];
    if(root!=viewController){ //不是根控制器
        //如果显示的不是根控制器，就需要拉长导航控制器View的高度
        CGRect frame=navigationController.view.frame;
        frame.size.height=[UIScreen mainScreen].applicationFrame.size.height+20;//除去状态栏的高度
        navigationController.view.frame=frame;
    
        // 添加Dock到跟控制器的View上面
        [_dock removeFromSuperview];
        CGRect dockFrame=_dock.frame;
        dockFrame.origin.y=root.view.frame.size.height-_dock.frame.size.height;

        if([root.view isKindOfClass:[UIScrollView class]]){
            UIScrollView *scroller=(UIScrollView *)root.view;
            dockFrame.origin.y+=scroller.contentOffset.y;
        }
        //调整dock 的y 值
        _dock.frame = dockFrame;
        [root.view addSubview:_dock];
        
    }
    
}
- (void)back
{
    [self.childViewControllers[_dock.selectIndex] popViewControllerAnimated:YES];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];
    if (root==viewController) {
        // 1.让导航控制器view的高度还原
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height+20 - _dock.frame.size.height;
        navigationController.view.frame = frame;
        
        // 2.添加Dock到根控制器的View上面
        [_dock removeFromSuperview];
        CGRect dockFrame = _dock.frame;
        // 调整dock的y值
        dockFrame.origin.y = self.view.frame.size.height - _dock.frame.size.height;
        _dock.frame = dockFrame;
        [self.view addSubview:_dock];
    }
}

-(void)addDockItem
{
    // 2.往Dock  里面填充内容
    
    [_dock addItemWithIcon:@"tabbar_item_home" selectedIcon:@"tabbar_item_home_selected" title:@"首页" andSelectedTitleColor:[UIColor blueColor]];
    
    [_dock  addItemWithIcon:@"tabbar_item_question" selectedIcon:@"tabbar_item_question_selected"  title:@"动态" andSelectedTitleColor:[UIColor blueColor]];
    
    [_dock  addItemWithIcon:@"tabbar_item_person" selectedIcon:@"tabbar_item_person_selected"  title:@"发现" andSelectedTitleColor:[UIColor blueColor]];
    [_dock  addItemWithIcon:@"tabbar_item_reading" selectedIcon:@"tabbar_item_reading_selected"  title:@"我的" andSelectedTitleColor:[UIColor blueColor]];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
