//
//  PicTableViewCell.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "PicTableViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation PicTableViewCell
- (void)setValueWithPicModel:(NormalModel *)model
{
    
    self.TitleLabel.text = model.title;
    self.contextLabel.text = model.content;
    self.timeLabel.text = model.addtime_f;
    self.commentLabel.text =[NSString stringWithFormat:@"%@",model.counterList[@"comment"]];


    [self.picImg sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22"]];




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
