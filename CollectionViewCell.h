//
//  CollectionViewCell.h
//  UIRadio
//
//  Created by lanou on 16/7/15.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadModel.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (void)setValueWithReadModel:(ReadModel *)model;
@end
