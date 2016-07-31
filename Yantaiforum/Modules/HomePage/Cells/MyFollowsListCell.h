//
//  MyFollowsListCell.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/27.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mod_MyFollows.h"

@interface MyFollowsListCell : UITableViewCell

@property (nonatomic,strong)Mod_MyFollows * model;

@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImg;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
