//
//  MyFollowsView.m
//  Yantaiforum
//
//  Created by sunxb on 16/7/27.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "MyFollowsView.h"
#import "MJPullTableView.h"
#import "MyFollowsListCell.h"

@interface MyFollowsView ()<UITableViewDelegate,UITableViewDataSource>
{
    MJPullTableView * rootTableView;
}
@end

@implementation MyFollowsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTableView];
    }
    return self;
}

- (void)followsViewLoadData {
    [rootTableView reloadData];
}

- (void)addTableView {
    rootTableView = [[MJPullTableView alloc] initWithFrame:self.bounds];
    rootTableView.delegate = self;
    rootTableView.dataSource = self;
    [self addSubview:rootTableView];
}

#pragma mark tableView delegate & dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"followListCellStyle1";
    MyFollowsListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyFollowsListCell" owner:self options:nil] firstObject];
    }
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
