//
//  CollectionViewCell.m
//  UIRadio
//
//  Created by lanou on 16/7/15.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "CollectionViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@implementation CollectionViewCell
- (void)setValueWithReadModel:(ReadModel *)model
{
    
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22"]];
    NSString *str = model.name;
    NSString *str1 = model.enname;
    
    NSString *newStr = [str stringByAppendingFormat:@" %@",str1];
    self.nameLabel.text = newStr;
   
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
