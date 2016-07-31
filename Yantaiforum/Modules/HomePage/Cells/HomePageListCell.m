//
//  HomePageListCell.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageListCell.h"
#import "Mod_HomePage.h"

@implementation HomePageListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textColor = color(99, 99, 99);
    self.hotLabel.textColor = color(165, 165, 165);
    self.timeLabel.textColor = color(165, 165, 165);
    self.lineView.backgroundColor = color(233, 233, 233);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(Mod_HomePageList *)model {
    
//    if (_model != model) {
//        _model = nil;
//        _model = model;
//    }
    
    if (model.pics.count!=0) {
        Mod_HomeBannerPic * picMod = model.pics[0];
        [self.iconImg sd_setImageWithURL:[NSURL URLWithString:picMod.url]];
    }
    
    self.titleLabel.text = model.title;
    self.hotLabel.text = [NSString stringWithFormat:@"%ld人气",model.click];
    self.timeLabel.text = [self getTime:model.pubdate];
}


- (NSString *)getTime:(NSString *)_time {
    NSString * timeStr;
    
    //拿到现在的时间
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time;
    
    long long int pubdate = [_time intValue];
    long long int count = date - pubdate;
    
    if (count/60 <= 10 ) {
        timeStr = @"刚刚";
    }
    else if (count/60>10 && count/60<60){
        timeStr = [NSString stringWithFormat:@"%lld分钟前",count/60];
    }
    else if (count/60 >= 60 && count/60 < 60*24){
        timeStr = [NSString stringWithFormat:@"%lld小时前",count/60/60];
    }
    else if (count/60 >= 60*24){
        timeStr = [NSString stringWithFormat:@"%lld天前",count/60/60/24];
    }
    return timeStr;
}


@end
