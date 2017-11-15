//
//  AVPlayViewController.h
//  masy
//
//  Created by Admin on 16/11/30.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "BaseViewController.h"
@interface AVPlayViewController : BaseViewController<AVPlayerViewControllerDelegate> {
    AVPlayer *_player; /**< 媒体播放器 */
    AVPlayerViewController *_playerViewController; /**< 媒体播放控制器 */
    AVAudioSession              *_session;
}
@property (nonatomic, strong) AVPlayer *player; /**< 媒体播放器 */
@property (nonatomic, strong) AVPlayerViewController *playerViewController; /**< 媒体播放控制器 */
/* playItem */
@property (nonatomic, retain) AVPlayerItem *currentItem;
- (void)initializeUserInterface; /**< 初始化用户界面 */
@end
