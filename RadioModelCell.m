//
//  RadioModelCell.m
//  UIRadio
//
//  Created by lanou on 16/7/6.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "RadioModelCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation RadioModelCell
- (void)setValueWithModel:(RadioModel *)model
{
    
    self.RadioTitle.text = model.title;
    self.RadioDesc.text = model.desc;
    
    
    
    [self.RadioBGImage sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22.jpg"]];
    
    
    

    NSString *str = [NSString stringWithFormat:@"%ld",model.count];
    self.RadioCount.text = str;
    
    self.RadioUser.text = model.userinfo[@"uname"];
    
    
    
    

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
