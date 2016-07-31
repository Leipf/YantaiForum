//
//  HomePageFocusBtnView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageFocusBtnView.h"
#import "Mod_HomePage.h"

@interface HomePageFocusBtnView ()
{
    NSMutableArray * dataArr;
}
@end

@implementation HomePageFocusBtnView

- (instancetype)initWithFrame:(CGRect)frame dataArr:(NSMutableArray *)_data {
    if (self = [super initWithFrame:frame]) {
        if (_data.count!=0) {
            dataArr = [[NSMutableArray alloc] initWithArray:_data];
            [self addSubBtn];
        }
        
    }
    return self;
}

- (void)addSubBtn {
//    NSInteger btnNum = dataArr.count;
    CGFloat subViewWidth = self.frame.size.width/4.0;
    CGFloat subViewHeight = subViewWidth;
    
    for (int i = 0; i < 8; i ++) {
        NSInteger col = i / 4;
        NSInteger row = i % 4;
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(row*subViewWidth, col*subViewHeight, subViewWidth, subViewHeight)];
        subView.tag = 1000+i;
        Mod_HomePageBanner * model = dataArr[i];
        [self loadSubView:subView modelData:model];
        [self addSubview:subView];
    }
}

- (void)loadSubView:(UIView *)_view modelData:(Mod_HomePageBanner *)_model {
    UIButton * subBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, _view.frame.size.width-40, _view.frame.size.width-40)];
    [subBtn sd_setImageWithURL:[NSURL URLWithString:_model.picurl] forState:UIControlStateNormal];
    subBtn.backgroundColor = [UIColor redColor];
    subBtn.layer.cornerRadius = (_view.frame.size.width-40)/2.0;
    subBtn.layer.masksToBounds = YES;
    subBtn.tag = _view.tag+1000;
    [_view addSubview:subBtn];
    
    UILabel * subLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, _view.frame.size.width-20-5, _view.frame.size.width, 20)];
    subLbl.textAlignment = NSTextAlignmentCenter;
    subLbl.textColor = color(161, 161, 161);
    subLbl.font = Font12;
    subLbl.text = _model.name;
    [_view addSubview:subLbl];
    
//    return _view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
