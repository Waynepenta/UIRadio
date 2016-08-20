//
//  RadioModel.h
//  UIRadio
//
//  Created by lanou on 16/7/6.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadioModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *coverimg;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,strong) NSDictionary *userinfo;
@property (nonatomic,copy) NSString *radioid;
@end
