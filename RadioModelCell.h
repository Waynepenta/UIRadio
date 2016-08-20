//
//  RadioModelCell.h
//  UIRadio
//
//  Created by lanou on 16/7/6.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioModel.h"

@interface RadioModelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *RadioBGImage;
@property (weak, nonatomic) IBOutlet UILabel *RadioTitle;

@property (weak, nonatomic) IBOutlet UILabel *RadioDesc;

@property (weak, nonatomic) IBOutlet UILabel *RadioCount;
@property (weak, nonatomic) IBOutlet UILabel *RadioUser;





- (void)setValueWithModel:(RadioModel *)model;
@end
