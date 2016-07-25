//
//  HomePageFocusBtnView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageFocusBtnView.h"

@interface HomePageFocusBtnView ()
{
    NSMutableArray * dataArr;
}
@end

@implementation HomePageFocusBtnView

- (instancetype)initWithFrame:(CGRect)frame dataArr:(NSMutableArray *)_data {
    if (self = [super initWithFrame:frame]) {
        dataArr = [[NSMutableArray alloc] initWithArray:_data];
        [self addSubBtn];
    }
    return self;
}

- (void)addSubBtn {
    NSInteger btnNum = dataArr.count;
    CGFloat subViewWidth = self.frame.size.width/4.0;
    CGFloat subViewHeight = subViewWidth;
    
    for (int i = 0; i < 8; i ++) {
        NSInteger col = i / 4;
        NSInteger row = i % 4;
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(row*subViewWidth, col*subViewHeight, subViewWidth, subViewHeight)];
        subView.tag = 1000+i;
        [self loadSubView:subView];
        [self addSubview:subView];
    }
}

- (UIView *)loadSubView:(UIView *)_view {
    UIButton * subBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, _view.frame.size.width-40, _view.frame.size.width-40)];
    subBtn.backgroundColor = [UIColor redColor];
    subBtn.layer.cornerRadius = (_view.frame.size.width-40)/2.0;
    subBtn.layer.masksToBounds = YES;
    subBtn.tag = _view.tag+1000;
    [_view addSubview:subBtn];
    return _view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
