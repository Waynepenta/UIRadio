//
//  RadioDetailModel.h
//  UIRadio
//
//  Created by lanou on 16/7/7.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadioDetailModel : NSObject
@property (nonatomic,copy) NSString *coverimg;
@property (nonatomic,copy) NSString *musicVisit;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSDictionary *radioInfo;
@property (nonatomic,copy) NSString *tingid;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,copy) NSString *musicUrl;
@property (nonatomic,copy)NSString *webview_url;


@property (nonatomic,copy) NSDictionary *userinfo;


@property (nonatomic,strong) NSDictionary *playInfo;





@end
