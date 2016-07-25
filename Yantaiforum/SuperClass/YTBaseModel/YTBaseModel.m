//
//  YTBaseModel.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/22.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseModel.h"

@implementation YTBaseModel


- (instancetype)initWithResponseJSONObject:(id)_object {
    if (self = [super init]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_object options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSError * err = nil;
        self = [self initWithString:jsonString error:&err];
    }
    return self;
}

@end
