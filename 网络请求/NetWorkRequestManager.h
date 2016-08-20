//
//  NetWorkRequestManager.h
//  01-Leisure创建实体文件夹
//
//  Created by Lovecx on 16/3/29.
//  Copyright © 2016年 Lovecx. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义枚举
typedef NS_ENUM(NSInteger, RequestType) {
    GET,
    POST
};

// 网络请求完成和失败的block
typedef void (^RequestFinish)(NSData *data);
typedef void (^RequestError)(NSError *error);

@interface NetWorkRequestManager : NSObject

@property (nonatomic, copy) RequestFinish finish;
@property (nonatomic, copy) RequestError finishError;

+ (void)requestWithType:(RequestType)type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finish:(RequestFinish)finish finishError:(RequestError)finishError;

@end
