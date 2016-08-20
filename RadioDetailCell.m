//
//  RadioDetailCell.m
//  UIRadio
//
//  Created by lanou on 16/7/7.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "RadioDetailCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation RadioDetailCell

- (void)setValueDataWithModel:(RadioDetailModel *)model
{
    
    self.DetailtitleLabel.text = model.title;
    
    self.musicCount.text = model.musicVisit;
    
    [self.DetailImageV sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22"]];
    
    
  
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
