//
//  HomePageListCell.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mod_HomePageList;

@interface HomePageListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotLabel;

@property (nonatomic,strong)Mod_HomePageList * model;

@end
