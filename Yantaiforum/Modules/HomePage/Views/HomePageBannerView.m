//
//  HomePageBannerView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/22.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageBannerView.h"

#define bannerView_width self.frame.size.width

@interface HomePageBannerView ()<UIScrollViewDelegate>
{
    UIScrollView * rootScroll;
    
    NSMutableArray * scrollImgArr;
    NSMutableArray * scrollTextArr;
}
@end

@implementation HomePageBannerView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSMutableArray *)_imgArr textArr:(NSMutableArray *)_textArr {
    if (self = [super initWithFrame:frame]) {
        
        scrollImgArr = [[NSMutableArray alloc] initWithArray:_imgArr];
        scrollTextArr = [[NSMutableArray alloc] initWithArray:_textArr];
        
        [self addBanner];
    }
    return self;
}
//withImageArr:(NSMutableArray *)_imgArr textArr:(NSMutableArray *)_textArr
- (void)addBanner {
    rootScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, bannerView_width, self.frame.size.height-30)];
    rootScroll.delegate = self;
    rootScroll.backgroundColor = [UIColor greenColor];
    rootScroll.contentSize = CGSizeMake(bannerView_width, 0);
    rootScroll.contentOffset = CGPointMake(bannerView_width, 0);
    [self addSubview:rootScroll];

    [self dealWithArray:scrollImgArr];
    [self dealWithArray:scrollTextArr];
    
    for (int i = 0; i < scrollImgArr.count; i ++) {
        UIImageView * scrollImg = [[UIImageView alloc] initWithFrame:CGRectMake(bannerView_width*i, 0, bannerView_width, self.frame.size.height-30)];
        [scrollImg sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[i]]];
        [rootScroll addSubview:scrollImg];
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(bannerScroll) userInfo:nil repeats:YES];
    
}

- (void)dealWithArray:(NSMutableArray *)_arr {
    if (_arr.count != 0) {
        [_arr insertObject:_arr[_arr.count-1] atIndex:0];
        [_arr addObject:_arr[1]];
    }
}

//
- (void)bannerScroll {
    
    [UIView animateWithDuration:1.5 animations:^{
        rootScroll.contentOffset = CGPointMake(rootScroll.contentOffset.x + self.frame.size.width, 0);
    }];
    [self scrollViewDidEndDecelerating:rootScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offSet = scrollView.contentOffset.x;
    
    if (offSet == bannerView_width*(scrollImgArr.count-1)) {
        scrollView.contentOffset = CGPointMake(bannerView_width, 0);
        
    }
    else if(offSet == 0){
        scrollView.contentOffset = CGPointMake((scrollImgArr.count-2)*bannerView_width, 0);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
