//
//  HTMLViewController.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/26.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "HTMLViewController.h"

@interface HTMLViewController ()<UIWebViewDelegate>
{
    UIWebView * webView;
}
@end

@implementation HTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"此页是WebView";
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kNavBarViewHeight, ScreenWidth, __Height_noTab)];
    webView.delegate = self;
    NSURL *url=[NSURL URLWithString:[self.receivedParams objectForKey:@"params_HTML"]];//
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
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
