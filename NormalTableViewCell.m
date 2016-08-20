//
//  NormalTableViewCell.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "NormalTableViewCell.h"

@implementation NormalTableViewCell
- (void)setValueWithModel:(NormalModel *)model
{
    self.titleLabel.text = model.title;
    self.addtime_fLabel.text = model.addtime_f;
    self.commentLabel.text = [NSString stringWithFormat:@"%@",model.counterList[@"comment"]];
    self.contentLabel.text = model.content;

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
