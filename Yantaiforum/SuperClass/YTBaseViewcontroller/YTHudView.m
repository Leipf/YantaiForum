//
//  YTHudView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTHudView.h"
#import <SVProgressHUD.h>

@implementation YTHudView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self.superview sendSubviewToBack:self];
        self.showTime = 0;
    }
    return self;
}

- (void)hudShow {
    [self.superview bringSubviewToFront:self];
    self.showTime += 1;
    if (self.showTime > 1) {
        
    }
    else {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD show];
    }
}

- (void)hudHidden {
    if (self.showTime > 0 ) {
        self.showTime -= 1;
        if (self.showTime < 1) {
            [SVProgressHUD dismiss];
        }
    }
}

- (void)hudShowWithText:(NSString *)_text afterDelay:(float)_time {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:_text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
