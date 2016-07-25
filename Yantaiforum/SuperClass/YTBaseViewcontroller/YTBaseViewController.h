//
//  BaseViewController.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "TBMBDefaultRootViewController.h"
#import "TBMBDefaultRootViewController+TBMBProxy.h"

@class YTNavgationBarView;

@interface YTBaseViewController : TBMBDefaultRootViewController

// 是否是根控制器
@property (nonatomic,assign) BOOL isRootPage;
@property (nonatomic,strong) NSString * backImgName;
// 上一个页面传过来的参数
@property (nonatomic,strong) NSMutableDictionary * receivedParams;

//自定义navBar
@property (nonatomic,strong)YTNavgationBarView * navbarView;
// 页面标题
@property (nonatomic,strong) UILabel * titleLbl;
// 页面返回按钮
@property (nonatomic,strong) UIButton * backBtn;

@property (nonatomic,strong) UIView * subNavBarView;


- (void)loadNavigationBarView;

@end
