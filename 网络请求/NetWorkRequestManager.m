//
//  NetWorkRequestManager.m
//  01-Leisure创建实体文件夹
//
//  Created by Lovecx on 16/3/29.
//  Copyright © 2016年 Lovecx. All rights reserved.
//

#import "NetWorkRequestManager.h"

@implementation NetWorkRequestManager

+ (void)requestWithType:(RequestType)type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finish:(RequestFinish)finish finishError:(RequestError)finishError {
    NetWorkRequestManager *manager = [[NetWorkRequestManager alloc] init];
    [manager requestWithType:type urlString:urlString parDic:parDic finish:finish finishError:finishError];
}

- (void)requestWithType:(RequestType)type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finish:(RequestFinish)finish finishError:(RequestError)finishError {
    
    self.finish = finish;
    self.finishError = finishError;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    if (type == POST) {
        [request setHTTPMethod:@"POST"];
        if (parDic.count > 0) {
            NSData *data = [self parDicToDataQithDic:parDic];
            [request setHTTPBody:data];
        }
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            self.finish(data);
        } else {
            self.finishError(error);
        }
    }];
    [task resume];
}

- (NSData *)parDicToDataQithDic:(NSDictionary *)dict {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *key in dict) {
        NSString *str = [NSString stringWithFormat:@"%@=%@", key, dict[key]];
        [array addObject:str];
    }
    NSString *parString = [array componentsJoinedByString:@"&"];
    return [parString dataUsingEncoding:NSUTF8StringEncoding];
}

@end
