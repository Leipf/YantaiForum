//
//  Mod_MyFollows.h
//  Yantaiforum
//
//  Created by sunxb on 16/7/27.
//  Copyright © 2016年 sunxb. All rights reserved.
//

#import "YTBaseModel.h"

@interface Mod_MyFollowsComments : YTBaseModel

@property (nonatomic,strong) NSString * commentid;
@property (nonatomic,strong) NSString * fromuserid;
@property (nonatomic,strong) NSString * fromuser;
@property (nonatomic,strong) NSString * touserid;
@property (nonatomic,strong) NSString * touser;
@property (nonatomic,strong) NSString * content;

@end


@interface Mod_MyFollowsSlidepicurl : YTBaseModel
// 内容中的图片
@property (nonatomic,strong) NSString * tburl;
@property (nonatomic,strong) NSString * url;
@property (nonatomic,strong) NSString * width;
@property (nonatomic,strong) NSString * height;
@end

@interface Mod_MyFollowsApplauds : YTBaseModel

@property (nonatomic,strong) NSString * userid;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * user_url;
@end



@protocol Mod_MyFollowsSlidepicurl
@end
@protocol Mod_MyFollowsComments
@end
@protocol Mod_MyFollowsApplauds
@end
@interface Mod_MyFollowsList : YTBaseModel

@property (nonatomic,strong) NSString * id;
@property (nonatomic,strong) NSString * jump_url;
@property (nonatomic,strong) NSString * source;
@property (nonatomic,strong) NSString * type;
@property (nonatomic,strong) NSString * username;
@property (nonatomic,strong) NSString * sex;
@property (nonatomic,strong) NSString * pubdate;
@property (nonatomic,strong) NSString * tips;
@property (nonatomic,strong) NSString * des;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,assign) NSInteger click;
@property (nonatomic,assign) NSInteger applaud; // 点赞数
@property (nonatomic,assign) NSInteger comment; // 评论数
@property (nonatomic,assign) NSInteger slidepicurlcount; // 图片数

@property (nonatomic,strong) NSMutableArray <Mod_MyFollowsSlidepicurl> * slidepicurl;
@property (nonatomic,strong) NSMutableArray <Mod_MyFollowsComments> * comments;
@property (nonatomic,strong) NSMutableArray <Mod_MyFollowsApplauds> * applauds;

@property (nonatomic,assign) NSInteger heats;
@property (nonatomic,assign) NSInteger show_type;
@end



@protocol Mod_MyFollowsList
@end
@interface Mod_MyFollows : YTBaseModel

@property (nonatomic,strong)NSMutableArray <Mod_MyFollowsList> * list;
@end
