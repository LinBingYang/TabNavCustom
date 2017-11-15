//


#import "TestTwoViewController.h"

@interface TestTwoViewController ()

@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavWithTitle:@"发现" selectNavBgImgIndex:1 selectedTitleColorIndex:0 createMenuItem:^UIView *(int nIndex) {
        
        //示例图片尺寸为56 X 17 如需调整 请到JLBaseViewController.m 中 bgIndex==1处修改
        [self.titleImage setImage:[UIImage imageNamed:@"navLogo"]];
        
        if(nIndex == 0) {
            
            //可添加控件 比如返回按钮。。。
        }
        if(nIndex == 1) {
            //同上
        }
        
        return nil;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
