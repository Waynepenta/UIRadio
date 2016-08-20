//
//  ProductViewCell.m
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import "ProductViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "payWebViewController.h"


@implementation ProductViewCell

- (void)setVauleProductModel:(ProductModel *)model
{
//    self.productImage.image = [UIImage imageNamed:model.coverimg];
    
    [self.productImage sd_setImageWithURL:[NSURL URLWithString:model.coverimg] placeholderImage:[UIImage imageNamed:@"22"]];
 
    self.productLabel.text = model.title;

    

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
