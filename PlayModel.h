//
//  PlayModel.h
//  UIRadio
//
//  Created by lanou on 16/7/9.
//  Copyright © 2016年 fuping zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayModel : NSObject
@property (nonatomic,copy)NSString *coverimg;
@property (nonatomic,copy)NSString *musicUrl;
@property (nonatomic,copy) NSString *musicVisit;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy)NSDictionary *playInfo;
@property (nonatomic,copy)NSString *webview_url;

@property (nonatomic,copy) NSDictionary *userinfo;


@end
