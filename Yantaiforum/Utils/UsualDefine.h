//
//  UsualDefine.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#ifndef UsualDefine_h
#define UsualDefine_h



#define YTHTTP_HEAD   @"http://magapp.ytbbs.com"



/*************************************************************************
 屏幕尺寸
 *************************************************************************/
#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height
#define __ScreenFrame       [[UIScreen mainScreen] bounds]
#define __Screen_Width      [[UIScreen mainScreen] bounds].size.width
#define __Screen_Height     ([[UIScreen mainScreen] bounds].size.height - 20)
#define __Height_noNavTab   (__Screen_Height - 44 - 50)
#define __Height_noTab      (__Screen_Height - 44)

#define IOS_VERSION     [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7_OR_LATER   (IOS_VERSION >= 7.0f)
#define IOS8_OR_LATER   (IOS_VERSION >= 8.0f)
#define IOS9_OR_LATER   (IOS_VERSION >= 9.0f)
#define kNavBarViewHeight           (IOS7_OR_LATER?64:44)
#define kStatusBarHeight            (IOS7_OR_LATER?20:0)

/*************************************************************************
 字体大小
*************************************************************************/

#define  Font10  [UIFont systemFontOfSize:10]
#define  Font11  [UIFont systemFontOfSize:11]
#define  Font12  [UIFont systemFontOfSize:12]
#define  Font13  [UIFont systemFontOfSize:13]
#define  Font14  [UIFont systemFontOfSize:14]
#define  Font15  [UIFont systemFontOfSize:15]
#define  Font16  [UIFont systemFontOfSize:16]
#define  Font17  [UIFont systemFontOfSize:17]
#define  Font18  [UIFont systemFontOfSize:18]
#define  Font19  [UIFont systemFontOfSize:19]
#define  Font20  [UIFont systemFontOfSize:20]

#define Font(size)      [UIFont systemFontOfSize:size]
#define FontBold(size)  [UIFont boldSystemFontOfSize:size]

/*************************************************************************
 颜色
 *************************************************************************/

#define color(r, g, b)              [UIColor colorWithRed: r / 255.0 green: g / 255.0 blue: b / 255.0 alpha: 1.0]
#define COLOR(r, g, b)              [UIColor colorWithRed: r / 255.0 green: g / 255.0 blue: b / 255.0 alpha: 1.0]
#define COLOR_A(r, g, b, a)         [UIColor colorWithRed: r / 255.0 green: g / 255.0 blue: b / 255.0 alpha: a]

#define color_575757    [UIColor convertHexToRGB:@"575757"]//黑色
#define color_717171    [UIColor convertHexToRGB:@"717171"]//灰色

/*************************************************************************
 NSLog
 *************************************************************************/
#ifdef DEBUG
#define NSLog(xx, ...)          NSLog(xx, ##__VA_ARGS__)
#define NSLogMethod(xx, ...)    NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(xx, ...)          ((void)0)
#define NSLogMethod(xx, ...)    ((void)0)
#endif

#endif /* UsualDefine_h */
