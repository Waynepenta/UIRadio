//
//  PlayViewCell.h
//  UIRadio
//
//  Created by lanou on 16/7/9.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayModel.h"

@interface PlayViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *PlayTitle;
@property (weak, nonatomic) IBOutlet UILabel *PlayName;
@property (weak, nonatomic) IBOutlet UIImageView *PlayImg;

@property (nonatomic,assign) BOOL isClick;


- (void)setValueWithModel:(PlayModel *)model;
@end
