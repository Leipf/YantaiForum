//
//  YTHudView.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTHudView : UIView

@property (nonatomic,assign) NSInteger showTime;// hud被请求出现的次数

- (void)hudShow;
- (void)hudHidden;
- (void)hudShowWithText:(NSString *)_text afterDelay:(float)_time;

@end
