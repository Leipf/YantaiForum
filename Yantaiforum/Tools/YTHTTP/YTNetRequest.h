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

typedef void(^NetSucceedBlock)(id object);
typedef void(^NetFailureBlock)(NSError * error);

@interface YTNetRequest : NSObject

//@property (nonatomic,copy)NetSucceedBlock netSucceed;
//@property (nonatomic,copy)NetFailureBlock netFailure;


+ (instancetype)shareInstance;

/**
 *  参数
 *
 *  @param _type    请求类型
 *  @param _api     接口
 *  @param _params  传入参数
 *  @param _succeed 成功回调
 *  @param _failure 失败回调
 */
- (void)netRequestType:(NETREQUEST_TYPE)_type API:(NSString *)_api params:(NSDictionary *)_params succeedBlock:(NetSucceedBlock)_succeed failure:(NetFailureBlock)_failure;


@end
