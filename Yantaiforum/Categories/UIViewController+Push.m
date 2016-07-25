//
//  UIViewController+Push.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "UIViewController+Push.h"
#import "YTBaseViewController.h"

@implementation UIViewController (Push)

- (void)pushNewController:(NSString *)_controller {
    [self pushNewController:_controller params:nil];
}

- (void)pushNewController:(NSString *)_controller params:(NSMutableDictionary *)_paramsDict {
    [self pushNewController:_controller params:_paramsDict hiddenTabbar:YES];
}

- (void)pushNewController:(NSString *)_controller params:(NSMutableDictionary *)_paramsDict hiddenTabbar:(BOOL)_hide {
    Class  class_Page = NSClassFromString(_controller);
    YTBaseViewController * push_VC = [[class_Page alloc] init];
    push_VC.hidesBottomBarWhenPushed = _hide;
    push_VC.receivedParams = _paramsDict;
    [self.navigationController pushViewController:push_VC animated:YES];
}

@end
