//
//  BaseNavigationController.m
//  BaseVC
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *navBar=[UINavigationBar appearance];
    //2.设置导航栏字体的颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSShadowAttributeName:[NSValue valueWithUIOffset:UIOffsetZero]}];
    [navBar setBarTintColor:[UIColor whiteColor]];
    navBar.tintColor = [UIColor blackColor];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    [navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];

}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
