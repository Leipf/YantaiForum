//
//  MyFollowsView.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/27.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseView.h"

@interface MyFollowsView : YTBaseView

@property (nonatomic,strong) NSArray * dataArr;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)followsViewLoadData;

@end
