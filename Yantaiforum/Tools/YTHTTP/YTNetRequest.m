//
//  YTNetRequest.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/24.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTNetRequest.h"

@implementation YTNetRequest

static YTNetRequest * shareRequest = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareRequest = [[YTNetRequest alloc] init];
    });
    return shareRequest;
}


+ (void)getRequestAPI:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure {
    [[YTNetRequest shareInstance] netRequestType:NET_GET API:_api params:_params succeedBlock:_succeed failure:_failure];
}

+ (void)postRequestAPI:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure {
    [[YTNetRequest shareInstance] netRequestType:NET_POST API:_api params:_params succeedBlock:_succeed failure:_failure];
}


- (void)netRequestType:(NETREQUEST_TYPE)_type API:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    if (_type == NET_GET) {
        [manager GET:_api parameters:_params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            _succeed(task,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            _failure(task,error);
        }];
    }
    else if (_type == NET_POST) {
        [manager POST:_api parameters:_params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            _succeed(task,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            _failure(task,error);
        }];
    }
}


@end
