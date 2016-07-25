//
//  YTHUD.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTHUD : NSObject

+ (void)hudShow;
+ (void)hudHidden;
+ (void)hudShowWithText:(NSString *)_text afterDelay:(float)_time;

@end
