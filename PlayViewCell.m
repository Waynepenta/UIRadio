//
//  PlayViewCell.m
//  UIRadio
//
//  Created by lanou on 16/7/9.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "PlayViewCell.h"
#import "PlayModel.h"

@implementation PlayViewCell

- (void)setValueWithModel:(PlayModel *)model
{
    
    self.PlayTitle.text = model.title;
    self.PlayName.text = [NSString stringWithFormat:@"by: %@",model.playInfo[@"userinfo"][@"uname"]];
    
   



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
