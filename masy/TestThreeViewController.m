//


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#import "TestThreeViewController.h"
//#import "newViewController.h"
@interface TestThreeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TestThreeViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault animated:YES];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 self.view.backgroundColor = [UIColor whiteColor];
    [self createNavWithTitle:@"发现" selectNavBgImgIndex:2 selectedTitleColorIndex:1 createMenuItem:^UIView *(int nIndex) {
        //黑底白字
        
        if(nIndex == 0) {
            
            //可添加控件 比如返回按钮。。。
            
        }
        if(nIndex == 1) {
            //同上
        }
        
        return nil;
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UIButton *left=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    left.backgroundColor=[UIColor redColor];
    [left addTarget:self action:@selector(leftaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:left];
}
-(void)leftaction{
//    newViewController *nc=[[newViewController alloc]init];
//    [self.navigationController pushViewController:nc animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIColor *color = [UIColor yellowColor];
    
    CGFloat scrollY =  scrollView.contentOffset.y;
    
    //滚动300以内都会变化，可根据需要调整
    CGFloat alphaScale =1-scrollView.contentOffset.y/300;
    
    if (scrollY == 0) {
        
        [self.navIV setBackgroundColor:[color colorWithAlphaComponent:1]];
        
    }else
    {
        [self.navIV setBackgroundColor:[color colorWithAlphaComponent:alphaScale]];
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
