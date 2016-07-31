//
//  YTNetRequest.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/24.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NETREQUEST_TYPE) {
    NET_GET = 0,
    NET_POST ,
};

typedef void(^NetSucceedBlock)(NSURLSessionDataTask * task, id object);
typedef void(^NetFailureBlock)(NSURLSessionDataTask * task, NSError * error);

@interface YTNetRequest : NSObject

//@property (nonatomic,copy)NetSucceedBlock netSucceed;
//@property (nonatomic,copy)NetFailureBlock netFailure;


+ (instancetype)shareInstance;



/**
 *  GET 参数说明
 *
 *  @param _api     接口
 *  @param _params  传入参数
 *  @param _succeed 成功回调
 *  @param _failure 失败回调
 */
+ (void)getRequestAPI:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure;

// POST
+ (void)postRequestAPI:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure;


@end
