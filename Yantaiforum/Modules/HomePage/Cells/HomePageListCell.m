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
    self.titleLabel.textColor = color(165, 165, 165);
    self.hotLabel.textColor = color(165, 165, 165);
    self.timeLabel.textColor = color(165, 165, 165);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(Mod_HomePageList *)model {
    
    if (model.pics.count!=0) {
        Mod_HomeBannerPic * picMod = model.pics[0];
        [self.iconImg sd_setImageWithURL:[NSURL URLWithString:picMod.url]];
    }
    
    self.titleLabel.text = model.title;
    self.hotLabel.text = [NSString stringWithFormat:@"%ld人气",model.click];
    self.timeLabel.text = @"";
}

@end
