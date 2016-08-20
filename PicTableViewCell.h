//
//  PicTableViewCell.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalModel.h"

@interface PicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImg;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

- (void)setValueWithPicModel:(NormalModel *)model;


@end
