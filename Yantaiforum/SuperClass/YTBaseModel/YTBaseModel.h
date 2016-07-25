//
//  YTBaseModel.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/22.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <JSONModel/JSONModel.h>

// 创建这个baseModel为了方便以后更改基本的字段用的,现阶段暂时没用

@interface YTBaseModel : JSONModel

- (instancetype)initWithResponseJSONObject:(id)_object;

@end
