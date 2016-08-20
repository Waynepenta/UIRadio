//
//  PlayManage.h
//  UIRadio
//
//  Created by lanou on 16/7/9.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayManage : NSObject
@property (nonatomic,strong) NSMutableArray *musicArray;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) AVPlayer  *player;

@property (nonatomic,assign) BOOL isPlay;

+ (instancetype)shareInstance;



- (void)playerProcessWithFloat:(CGFloat)processFloat;

- (void)replaceItemWithUrlString:(NSString *)urlString;

- (void)playerAndPause;

- (void)playerAbove;

- (void)playerNext;









@end
