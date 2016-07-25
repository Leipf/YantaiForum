//
//  BaseViewController.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseViewController.h"
#import "YTNavgationBarView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface YTBaseViewController ()

@end

@implementation YTBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.isRootPage = NO;
        self.backImgName = @"back";
    }
    return self;
}

-(void)setTitle:(NSString *)title {
    self.titleLbl.text = title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = __Screen_Width / 3;
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];

    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeBottom;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;

    // -- 加载导航栏
    [self loadNavigationBarView];
    
}


#pragma mark  添加自定义的navgitionBarView
- (void)loadNavigationBarView {
    self.navbarView = [[YTNavgationBarView alloc] initWithFrame:CGRectMake(0, 0, __Screen_Width, kNavBarViewHeight)];
    self.navbarView.backgroundColor = color(0, 151, 194);
    [self.view addSubview:self.navbarView];
    
    self.subNavBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight, __Screen_Width, 44)];
    [self.navbarView addSubview:self.subNavBarView];
    
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, __Screen_Width-(60*2), 44)];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    self.titleLbl.font = [UIFont systemFontOfSize:18];
    [self.subNavBarView addSubview:self.titleLbl];
    
    // -- 添加返回键
    [self addBackButton];
}

- (void)addBackButton {
    if (self.isRootPage) {
        return;
    }
    
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(4, 7, 25, 25)];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:self.backImgName] forState:UIControlStateNormal];
    [self.backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.subNavBarView addSubview:self.backBtn];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.fd_prefersNavigationBarHidden = YES;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.backBarButtonItem.title = @"";
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [self.view bringSubviewToFront:self.navbarView];
}

- (void)goBack:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
