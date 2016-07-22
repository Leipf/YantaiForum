//
//  HomePageViewController.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/21.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HomePageViewController.h"
#import <SVProgressHUD.h>
#import "HomePageBannerView.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.isRootPage = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首 页";
//    [self.hudView hudShow];
//    [self.hudView hudShowWithText:@"网络加载失败,请重试" afterDelay:10.0];
//    [SVProgressHUD show];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray * arr = @[@"http://magapp.ytbbs.com/upload//img/20160722/1469175233516150.jpg",
                     @"http://magapp.ytbbs.com/upload//img/20160722/1469175234409178.jpg",
                     @"http://magapp.ytbbs.com/upload//img/20160722/1469175235184347.jpg",
                     @"http://magapp.ytbbs.com/upload//img/20160722/1469175234946688.jpg"];
    NSMutableArray * imgArr = [[NSMutableArray alloc] initWithArray:@[@"http://magapp.ytbbs.com/upload//img/20160722/1469175233516150.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175234409178.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175235184347.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175234946688.jpg"]];
    HomePageBannerView * banner = [[HomePageBannerView alloc] initWithFrame:CGRectMake(0, kNavBarViewHeight, ScreenWidth, 200) imageArr:imgArr textArr:nil];
    [self.view addSubview:banner];
    
    // Do any additional setup after loading the view.
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
