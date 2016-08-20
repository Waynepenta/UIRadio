//
//  ProductViewCell.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface ProductViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UIButton *payButton;





- (void)setVauleProductModel:(ProductModel *)model;
@end
