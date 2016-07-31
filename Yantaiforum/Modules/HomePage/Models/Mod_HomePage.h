//
//  Mod_HomePage.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/25.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseModel.h"

@interface Mod_HomeBannerPic : YTBaseModel
@property (nonatomic,strong) NSString * url;
@end


@protocol Mod_HomeBannerPic
@end

@interface Mod_HomePageList : YTBaseModel

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,assign) NSInteger click;
@property (nonatomic,strong) NSString * comment;
@property (nonatomic,strong) NSString * pubdate;
@property (nonatomic,strong) NSString * status;
@property (nonatomic,strong) NSString * style;
@property (nonatomic,strong) NSMutableArray <Mod_HomeBannerPic> * pics;
@property (nonatomic,strong) NSString * jump_url;
@property (nonatomic,assign) NSInteger show_type;
@property (nonatomic,strong) NSString * icon;
@end


@interface Mod_HomePageBanner : YTBaseModel

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * picurl;
@property (nonatomic,strong) NSString * jump_url;
@end


//@interface Mod_HomePageBtnList : YTBaseModel
//@property (nonatomic,strong) NSString * id;
//@property (nonatomic,strong) NSString * name;
//@property (nonatomic,strong) NSString * picurl;
//@property (nonatomic,strong) NSString * jump_url;
//
//@end


@protocol Mod_HomePageBanner
@end
@protocol Mod_HomePageList
@end

@interface Mod_HomePage : YTBaseModel

@property (nonatomic,strong)NSMutableArray <Mod_HomePageBanner> * jump_j1;
@property (nonatomic,strong)NSMutableArray <Mod_HomePageList> * list;
@property (nonatomic,strong)NSMutableArray <Mod_HomePageBanner> * jump_j3;// 首页的点击按钮,model跟banner相同

@end





