//

#define kWidth [UIScreen mainScreen].bounds.size.width

#import "TestFourViewController.h"
//#import "HorizonViewController.h"
@interface TestFourViewController ()

@property (nonatomic, strong)UISearchBar *searchBar;

@end

@implementation TestFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    [self createNavWithTitle:@"" selectNavBgImgIndex:0 selectedTitleColorIndex:0 createMenuItem:^UIView *(int nIndex) {
        
        if(nIndex == 0) {
            
            //可添加控件 比如返回按钮。。。
        }
        if(nIndex == 1) {
            //同上
        }
        
        return nil;
    }];
    
    //可在导航栏添加需要的控件
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.frame =CGRectMake(48,7,kWidth - 100,30);
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.placeholder = @"搜索";
    _searchBar.layer.cornerRadius=4;
    _searchBar.layer.masksToBounds=YES;
    [_searchBar.layer setBorderWidth:1];
    [self.navView addSubview:_searchBar];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"横屏" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.frame = CGRectMake(20, 84, kWidth - 40, 40);
    [btn addTarget:self action:@selector(pushHorizonVC) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
}

-(void) pushHorizonVC {
//    HorizonViewController *horizon = [[HorizonViewController alloc]init];
//    [self presentViewController:horizon animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
