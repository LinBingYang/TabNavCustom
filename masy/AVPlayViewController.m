//
//  AVPlayViewController.m
//  masy
//
//  Created by Admin on 16/11/30.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "AVPlayViewController.h"

@interface AVPlayViewController ()

@end

@implementation AVPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.view.backgroundColor=[UIColor whiteColor];
    [self createNavWithTitle:@"首页" selectNavBgImgIndex:0 selectedTitleColorIndex:1 createMenuItem:^UIView *(int nIndex) {
        
        if(nIndex == 0) {
            
            //可添加控件 比如返回按钮。。。
            UIButton *left=[[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 30)];
            left.backgroundColor=[UIColor redColor];
            [left addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:left];
        }
        if(nIndex == 1) {
            //同上
        }
        
        return nil;
    }];
    [self initializeUserInterface];
}
-(void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initializeUserInterface{
    _session = [AVAudioSession sharedInstance];
    [_session setCategory:AVAudioSessionCategoryPlayback error:nil];
    if (_player) {
        [_player pause];
        _player = nil;
    }
    
    // 初始化URL资源地址
    
    // 获取网络资源地址
    // + (nullable instancetype)URLWithString:(NSString *)URLString;
    
    // 1、获取本地资源地址
    NSURL *url = [NSURL URLWithString:@"http://flv2.bn.netease.com/videolib3/1611/30/xnDLC2189/SD/xnDLC2189-mobile.mp4"];
    
//    _player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://flv2.bn.netease.com/videolib3/1611/30/xnDLC2189/SD/xnDLC2189-mobile.mp4"]];
////    AVPlayerItem *playerItem=[AVPlayerItem playerItemWithURL:[NSURL URLWithString:urlString]];
////    _player = [AVPlayer playerWithPlayerItem:playerItem];
//    _playerViewController = [[AVPlayerViewController alloc] init];
//    _playerViewController.player = _player;
//    _playerViewController.videoGravity = AVLayerVideoGravityResizeAspect;
////    _playerViewController.allowsPictureInPicturePlayback = true;    //画中画，iPad可用
//    _playerViewController.showsPlaybackControls = true;
//    
//    [self addChildViewController:_playerViewController];
//    _playerViewController.view.translatesAutoresizingMaskIntoConstraints = true;    //AVPlayerViewController 内部可能是用约束写的，这句可以禁用自动约束，消除报错
//    //self.view.bounds
//    _playerViewController.view.frame = CGRectMake(0, 64, 320, 300);
//    [self.view addSubview:_playerViewController.view];
//    [_playerViewController.player play];    //自动播放
//    // 2、初始化媒体播放控制器
    if (_playerViewController) {
        _playerViewController = nil;
    }
    // 3、配置媒体播放控制器
    _playerViewController = [[AVPlayerViewController alloc]  init];
    // 设置媒体源数据
    _playerViewController.player = [AVPlayer playerWithURL:url];
    // 设置拉伸模式
    _playerViewController.videoGravity = AVLayerVideoGravityResizeAspect;
    // 设置是否显示媒体播放组件
    _playerViewController.showsPlaybackControls = YES;
    // 设置大力
    _playerViewController.delegate = self;
    // 播放视频
    [_playerViewController.player play];
    // 设置媒体播放器视图大小
    _playerViewController.view.bounds = CGRectMake(0, 0, 350, 300);
    _playerViewController.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), 64 + CGRectGetMidY(_playerViewController.view.bounds) + 30);
    // 4、推送播放
    // 推送至媒体播放器进行播放
     [self presentViewController:_playerViewController animated:YES completion:nil];
    // 直接在本视图控制器播放
//    [self addChildViewController:_playerViewController];
//    [self.view addSubview:_playerViewController.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
