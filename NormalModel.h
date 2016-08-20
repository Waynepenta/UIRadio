//
//  NormalModel.h
//  UIRadio
//
//  Created by lanou on 16/7/12.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NormalModel : NSObject
@property (nonatomic,copy) NSString *addtime_f;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) NSDictionary *counterList;
@property (nonatomic,copy) NSString *contentid;
@property (nonatomic,copy) NSString *coverimg;
@end
