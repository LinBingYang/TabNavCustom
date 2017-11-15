//
//  BaseViewController.h
//  BaseVC
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) UIImageView *statusBarView;//状态栏
@property (nonatomic, strong) UIView *navView;//导航栏
@property (nonatomic, assign, readonly) int nMutiple;
@property (nonatomic, strong) NSArray *arParams;
@property (nonatomic, strong) UIImageView *navIV;
@property (nonatomic, strong) UILabel *titleLabel;//导航栏标题
@property (nonatomic, strong)UIImageView *titleImage;//导航栏图片

//创建导航栏
- (void)createNavWithTitle:(NSString *)szTitle selectNavBgImgIndex:(NSInteger )bgIndex  selectedTitleColorIndex:(NSInteger)titleIndex  createMenuItem:(UIView *(^)(int nIndex))menuItem;
//主页面
-(void)presentMainView;

@end
