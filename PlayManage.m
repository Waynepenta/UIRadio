//
//  PlayManage.m
//  UIRadio
//
//  Created by lanou on 16/7/9.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "PlayManage.h"
static PlayManage *_playmanage = nil;
@implementation PlayManage
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _playmanage = [[PlayManage alloc] init];
    });
    
    return _playmanage;

}


- (instancetype)init
{
    if (self = [super init]) {
        _player = [[AVPlayer alloc] init];
    }

    return self;

}

- (void)playerPlay
{
    [_player play];
    _isPlay = YES;

}

- (void)playPause
{
    [_player pause];

    _isPlay = NO;
}

- (void)playerProcessWithFloat:(CGFloat)processFloat
{
    
    [self.player seekToTime:CMTimeMakeWithSeconds(processFloat, 1) completionHandler:^(BOOL finished) {
        
        [self playerPlay];
    }];


}


- (void)replaceItemWithUrlString:(NSString *)urlString
{

    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:urlString]];
    
    [self.player replaceCurrentItemWithPlayerItem:item];

    [self playerPlay];

}

- (void)playerAndPause
{
    if (self.isPlay == YES) {
        [self playPause];
    }else{
        [self playerPlay];
    }


}

- (void)playerAbove
{
    if (self.index == 0 ) {
        self.index = self.musicArray.count - 1;
    }else{
        self.index--;
    }
  

}


- (void)playerNext
{
    if (self.index == self.musicArray.count - 1) {
        self.index = 0;
    }else{
    
        self.index++;
    }


}


















@end
