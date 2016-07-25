//
//  UIViewController+Push.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Push)

- (void)pushNewController:(NSString *)_controller;
- (void)pushNewController:(NSString *)_controller params:(NSMutableDictionary *)_paramsDict;

- (void)pushNewController:(NSString *)_controller params:(NSMutableDictionary *)_paramsDict hiddenTabbar:(BOOL)_hide;
@end
