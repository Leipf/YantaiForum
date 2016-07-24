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

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource>

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
    NSString * apiStr= @"http://magapp.ytbbs.com/pro_index_home?_token=3308211df41e3681029bb3d51b3a24e3&build=9.3.3.0&catid=10&clienttype=ios&deviceid=E6A86C3B-D768-4A51-90F4-1FD04B51978C&network=WiFi&p=1&step=20&version=51";
    [[YTNetRequest shareInstance] netRequestType:0 API:apiStr params:nil succeedBlock:^(id object) {
        NSLog(@"%@",object);
    } failure:^(NSError *error) {
        
    }];
    
    UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarViewHeight, __Screen_Width, __Height_noNavTab)];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    NSMutableArray * imgArr = [[NSMutableArray alloc] initWithArray:@[@"http://magapp.ytbbs.com/upload//img/20160722/1469175233516150.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175234409178.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175235184347.jpg",
                                                                      @"http://magapp.ytbbs.com/upload//img/20160722/1469175234946688.jpg"]];
    NSArray * arr = @[@"11111111111",@"222222222",@"3333333333",@"4444444444"];
    HomePageBannerView * banner = [[HomePageBannerView alloc] initWithFrame:CGRectMake(0, kNavBarViewHeight, ScreenWidth, 200) imageArr:imgArr textArr:arr];
    [self.view addSubview:banner];
    
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"homePage";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    return cell;
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
