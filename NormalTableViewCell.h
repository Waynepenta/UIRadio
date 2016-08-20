//
//  NormalTableViewCell.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalModel.h"

@interface NormalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addtime_fLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

- (void)setValueWithModel:(NormalModel *)model;




@end
