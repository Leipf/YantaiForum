//
//  HomePageBannerView.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/22.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseView.h"

typedef void(^BannerBlock)(NSInteger tapIndex);

@interface HomePageBannerView : YTBaseView


@property (nonatomic,copy)BannerBlock bannerBlock;

/**
 *  参数说明
 *
 *  @param frame    frame
 *  @param _imgArr  轮播图片的urlStr数组
 *  @param _textArr 轮播图片对应的文字 数组
 *
 */
- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)_imgArr textArr:(NSArray *)_textArr;


@end
