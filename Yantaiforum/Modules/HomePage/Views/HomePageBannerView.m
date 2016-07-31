//
//  HomePageBannerView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/22.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageBannerView.h"

#define bannerView_width   self.frame.size.width
#define bannerView_height  (self.frame.size.height-30)

//static NSInteger imageCount = 3;

@interface HomePageBannerView ()<UIScrollViewDelegate>
{
    UIScrollView * rootScroll;
    UIPageControl * pageControl;
    UILabel * textLbl;
    
    NSArray * scrollImgArr;
    NSArray * scrollTextArr;
    
    UIImageView * leftImgView;
    UIImageView * middleImgView;
    UIImageView * rightImgView;
    
    NSInteger currentImgIndex;
    
    NSInteger imgCount;
    
    NSTimer * timer;
}
@end

@implementation HomePageBannerView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)_imgArr textArr:(NSArray *)_textArr {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        scrollImgArr = _imgArr;
        scrollTextArr = _textArr;
        
        if (_imgArr.count==0 || _textArr.count==0) {
            return self;
        }
        
        imgCount = scrollImgArr.count;
        
        [self addScrollView];
        [self addImageViews];
        [self addPageControl];
        [self addTextLebal];
        
        [self setDefaultImg];
    }
    return self;
}

#pragma mark 添加滚动视图
- (void)addScrollView {
    rootScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, bannerView_width, self.frame.size.height-30)];
    rootScroll.showsVerticalScrollIndicator = NO;
    rootScroll.showsHorizontalScrollIndicator = NO;
    rootScroll.pagingEnabled = YES;
    rootScroll.delegate = self;
    rootScroll.contentSize = CGSizeMake(bannerView_width*(imgCount), 0);
    rootScroll.contentOffset = CGPointMake(bannerView_width, 0);
    [self addSubview:rootScroll];
    
}

#pragma mark 添加三张图片
- (void)addImageViews {
    leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bannerView_width, bannerView_height)];
    [rootScroll addSubview:leftImgView];
    
    middleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(bannerView_width, 0, bannerView_width, bannerView_height)];
    middleImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapImg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnBannerImage:)];
    [middleImgView addGestureRecognizer:tapImg];
    [rootScroll addSubview:middleImgView];
    
    rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(bannerView_width*2, 0, bannerView_width, bannerView_height)];
    [rootScroll addSubview:rightImgView];
    
}

- (void)tapOnBannerImage:(UITapGestureRecognizer *)recognize {
    self.bannerBlock(currentImgIndex);
    NSLog(@"%ld",currentImgIndex);
}

#pragma mark 添加小圆点
- (void)addPageControl {
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(bannerView_width-100, bannerView_height, 100, 30)];
    pageControl.numberOfPages = imgCount;
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = color(0, 151, 194);
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self addSubview:pageControl];
}

#pragma mark 添加提示信息控件
- (void)addTextLebal {
    textLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, bannerView_height, bannerView_width-100-20, 30)];
    textLbl.font = Font12;
    textLbl.textAlignment = NSTextAlignmentLeft;
    textLbl.textColor = [UIColor blackColor];
    textLbl.text = scrollTextArr[0];
    [self addSubview:textLbl];
}

#pragma mark 设置默认图片
- (void)setDefaultImg {
    [middleImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[0]]];
    [leftImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[imgCount-1]]];
    [rightImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[1]]];
    currentImgIndex = 0;
    
    [self addTimer];
}

- (void)addTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(bannerScroll) userInfo:nil repeats:YES];
}

- (void)closeTimer {
    [timer invalidate];
}


#pragma mark 自动滚动的事件
- (void)bannerScroll {
    [UIView animateWithDuration:0.6 animations:^{
        rootScroll.contentOffset = CGPointMake(rootScroll.contentOffset.x + self.frame.size.width, 0);
    }];
    [self scrollViewDidEndDecelerating:rootScroll];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == rootScroll) {
        [self reloadImg];
        rootScroll.contentOffset = CGPointMake(bannerView_width, 0);
        pageControl.currentPage = currentImgIndex;
        textLbl.text = scrollTextArr[currentImgIndex];
    }
    
}

#pragma mark 重新加载图片位置
- (void)reloadImg {
    NSInteger leftImageIndex,rightImageIndex;
    CGPoint offset = rootScroll.contentOffset;
    if (offset.x > bannerView_width) { // 右滑
        currentImgIndex = (currentImgIndex+1)%imgCount;
    }else if(offset.x < bannerView_width){ // 左滑
        currentImgIndex = (currentImgIndex+imgCount-1)%imgCount;
    }
    [middleImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[currentImgIndex]]];
    
    //重新设置左右图片
    leftImageIndex = (currentImgIndex+imgCount-1) % imgCount;
    rightImageIndex = (currentImgIndex+1) % imgCount;
    
    [leftImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[leftImageIndex]]];
    [rightImgView sd_setImageWithURL:[NSURL URLWithString:scrollImgArr[rightImageIndex]]];
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self closeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
