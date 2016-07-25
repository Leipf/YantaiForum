//
//  YTHUD.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTHUD.h"
#import <SVProgressHUD.h>

@implementation YTHUD

+ (void)hudShow {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"请稍等"];
}

+ (void)hudHidden {
    [SVProgressHUD dismiss];
}

+ (void)hudShowWithText:(NSString *)_text afterDelay:(float)_time {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showImage:nil status:_text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

@end
