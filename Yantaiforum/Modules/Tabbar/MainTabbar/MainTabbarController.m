//
//  MainTabbarController.m
//
//  Created by sunxb on 16/4/5.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "MainTabbarController.h"
#import "HomePageViewController.h"
#import "SharePictureViewController.h"
#import "MessageViewController.h"
#import "FindViewController.h"
#import "MyTabBarItem.h"

@interface MainTabbarController ()
{
    UIImageView * myTabbar;
}
@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubVC];
    
    [self createTabbar];
    
    [self setTabbarItems];
    
    // Do any additional setup after loading the view.
}




- (void)createTabbar {
    myTabbar = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    myTabbar.backgroundColor = [UIColor whiteColor];
//    myTabbar.backgroundColor = [UIColor whiteColor];
    myTabbar.userInteractionEnabled = YES;
    [self.tabBar addSubview:myTabbar];
}


#pragma mark 给tabbar添加控制器
- (void)createSubVC {
    
    HomePageViewController * homeVC = [[HomePageViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    SharePictureViewController * shareVC = [[SharePictureViewController alloc] init];
    UINavigationController *shareNav = [[UINavigationController alloc] initWithRootViewController:shareVC];
    
    MessageViewController * messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
 
    FindViewController * findVC = [[FindViewController alloc] init];
    UINavigationController *findNav = [[UINavigationController alloc] initWithRootViewController:findVC];
   
    self.viewControllers = @[homeNav,shareNav,messageNav,findNav];
}


#pragma mark 设置tabbar
- (void)setTabbarItems {
    NSArray * titleArr = @[@"首页",@"微分享",@"消息",@"发现"];
    NSArray * imgArr = @[@"tab_icon_index_n",@"tab_icon_picshare_n",@"tab_icon_message_n",@"tab_icon_find_n"];
    NSArray * imgHLArr = @[@"tab_icon_index_f",@"tab_icon_picshare_f",@"tab_icon_message_f",@"tab_icon_find_f"];
    
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat itemWidth = screenWidth / titleArr.count;
    for (int i = 0; i<titleArr.count; i++) {
        
        MyTabBarItem *item = [[MyTabBarItem alloc]initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, 49)];
        [item setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        [item setImage:[UIImage imageNamed:imgHLArr[i]] forState:UIControlStateSelected];
        [item setTitle:titleArr[i] forState:UIControlStateNormal];
        [myTabbar addSubview:item];
        
        if (i == 0) {
            item.selected = YES;
        }
        
        item.tag = 100 + i;
        [item addTarget:self action:@selector(tabbarAction:) forControlEvents:UIControlEventTouchUpInside];
    }    
}

- (void)tabbarAction:(UIButton *)item {
    
    //取消所有按钮的选中状态
    for (MyTabBarItem *item in myTabbar.subviews) {
        if ([item isKindOfClass:[UIButton class]]) {
            item.selected = NO;
        }
    }
    if (item.tag - 100 < 4) {
        item.selected = YES;
        NSInteger index = item.tag - 100;
        self.selectedIndex = index;
    }
    
    
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
