
//
//  RadioDetailCell.h
//  UIRadio
//
//  Created by lanou on 16/7/7.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioDetailModel.h"

@interface RadioDetailCell : UITableViewCell

- (void)setValueDataWithModel:(RadioDetailModel *)model;
@property (weak, nonatomic) IBOutlet UIImageView *DetailImageV;
@property (weak, nonatomic) IBOutlet UILabel *DetailtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicCount;
@property (weak, nonatomic) IBOutlet UIImageView *PlayButton;




@end
