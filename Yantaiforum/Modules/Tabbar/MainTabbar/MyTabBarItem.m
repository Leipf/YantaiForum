//
//  MyTabBarItem.m
//
//  Created by sunxb on 16/4/5.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "MyTabBarItem.h"

@implementation MyTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.backgroundColor = [UIColor clearColor];
        [self setTitleColor:[UIColor colorWithRed:0.36f green:0.36f blue:0.36f alpha:1.00f] forState:UIControlStateNormal];
        
        //选中
        [self setTitleColor:color(0, 151, 194) forState:UIControlStateSelected];
        
    }
    return self;
}

//去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 32, contentRect.size.width, 15);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake((contentRect.size.width - 25)/2.0, 4, 25, 25);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
