//


#import "TestOneViewController.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "JKDataHelper.h"
@interface TestOneViewController ()

@end

@implementation TestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    NSString *mcc = [carrier mobileCountryCode];
    NSString *mnc = [carrier mobileNetworkCode];
    
    NSString *imsi = [NSString stringWithFormat:@"%@%@", mcc, mnc];

    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
//    self.view.backgroundColor=[UIColor whiteColor];
    [self createNavWithTitle:@"首页" selectNavBgImgIndex:0 selectedTitleColorIndex:1 createMenuItem:^UIView *(int nIndex) {
       
        if(nIndex == 0) {
            
            //可添加控件 比如返回按钮。。。
        }
        if(nIndex == 1) {
            //同上
        }
        
        return nil;
    }];
    
    UILabel *lab=[UILabel new];
    lab.text=@"第一一月又一月";
    lab.textColor=[UIColor blackColor];
    lab.backgroundColor=[UIColor grayColor];
    [self.view addSubview:lab];
    UIButton *btn=[UIButton new];
    [btn addTarget: self action:@selector(btnaction) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:btn];
    UIView *view=[UIView new];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
    UIButton *iconbtn=[UIButton new];
    [iconbtn addTarget: self action:@selector(iconbtnaction) forControlEvents:UIControlEventTouchUpInside];
    [iconbtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:iconbtn];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(84);
        
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        [btn setTitle:@"时间" forState:UIControlStateNormal];
        make.left.mas_equalTo(100);
        make.top.equalTo(lab.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
        
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.and.bottom.mas_equalTo(-100);
        make.top.equalTo(btn.mas_bottom).offset(20);
        
    }];
    [iconbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [iconbtn setTitle:@"图标切换" forState:UIControlStateNormal];
        make.left.mas_equalTo(10);
        make.top.equalTo(view.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 40));
        
        
    }];

    if ([self isKindOfClass:[TestOneViewController class]]) {
        NSLog(@"%@",self);
    }else{
        NSLog(@"失败%@",self);
    }
}
-(void)btnaction{
    NSMutableArray * mutablArr = [NSMutableArray arrayWithObjects:@"111",@"222",@"333", nil];
    NSLog(@"object :%@",mutablArr[5]);
    [mutablArr objectAtIndex:5];
    [mutablArr addObject:nil];
    [mutablArr insertObject:nil atIndex:3];
    [mutablArr removeObjectAtIndex:3];
    [mutablArr replaceObjectAtIndex:1 withObject:nil];
    
    NSString *str = nil;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"111" forKey:nil];
    NSLog(@"dic:%@",dic);
    
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"111",@"aaa",@"222",@"bbb",@"333", nil];
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjects:str forKeys:@[@"111"]];
    
    NSMutableDictionary * h = [[NSMutableDictionary alloc] init];
    NSMutableDictionary * b = [[NSMutableDictionary alloc] init];
    [h setValue:str forKey:@"p"];
    
    
    quxian *v=[[quxian alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    v.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:v];
    
    CGPoint point=CGPointMake(23, 50);
    CGPoint point1=CGPointMake(69, 50);
    CGPoint point2=CGPointMake(114, 40);
    CGPoint point3=CGPointMake(160, 23);
    CGPoint point4=CGPointMake(206, 16);
    CGPoint point5=CGPointMake(252, 20);
    CGPoint point6=CGPointMake(297, 23);
    NSValue *v1=[NSValue valueWithCGPoint:point];
    NSValue *v2=[NSValue valueWithCGPoint:point1];
    NSValue *v3=[NSValue valueWithCGPoint:point2];
    NSValue *v4=[NSValue valueWithCGPoint:point3];
    NSValue *v5=[NSValue valueWithCGPoint:point4];
    NSValue *v6=[NSValue valueWithCGPoint:point5];
    NSValue *v7=[NSValue valueWithCGPoint:point6];
    NSArray *arr=[[NSArray alloc]initWithObjects:v1,v2,v3,v4,v5,v6,v7, nil];
    [v addBezierThroughPoints:arr];
//    AVPlayViewController *avp=[[AVPlayViewController alloc]init];
//    [self.navigationController pushViewController:avp animated:YES];
}
-(void)iconbtnaction{
//    [self getSub:self.navigationController.navigationBar andLevel:1];
    NSString *name=[UIApplication sharedApplication].alternateIconName;
    if ([name isEqualToString:@"120"]) {
        [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            NSLog(@"%@",error);
        }];
    }else
    [[UIApplication sharedApplication] setAlternateIconName:@"120" completionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}
// 递归获取子视图
- (void)getSub:(UIView *)view andLevel:(int)level {
    NSArray *subviews = [view subviews];
    
    // 如果没有子视图就直接返回
    if ([subviews count] == 0) return;
    
    for (UIView *subview in subviews) {
        
        // 根据层级决定前面空格个数，来缩进显示
        NSString *blank = @"";
        for (int i = 1; i < level; i++) {
            blank = [NSString stringWithFormat:@"  %@", blank];
        }
        
        // 打印子视图类名
        NSLog(@"%@%d: %@", blank, level, subview.class);
        
        // 递归获取此视图的子视图
        [self getSub:subview andLevel:(level+1)];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
