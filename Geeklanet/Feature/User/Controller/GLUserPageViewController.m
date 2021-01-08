//
//  GLUserPageViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserPageViewController.h"

@interface GLUserPageViewController ()<UISearchBarDelegate>

@property (nonatomic,strong)UILabel* navigationBar;
@property (strong,nonatomic) UIImageView* gender;
@property (strong,nonatomic) UIImageView* home;
@property (strong,nonatomic) UIButton* avatra;
@property (strong,nonatomic) UIButton* setting;
@property (strong,nonatomic) UIButton* follow;
@property (strong,nonatomic) UIButton* fan;
@property (strong,nonatomic) UIButton* like;
@property (strong,nonatomic) UILabel* userName;
@property (strong,nonatomic) UILabel* userTitle;
@property (strong,nonatomic) UILabel* oneLevel;
@property (strong,nonatomic) UILabel* twoLevel;
@property (strong,nonatomic) UILabel* threeLevel;
@property (strong,nonatomic) UILabel* followNum;
@property (strong,nonatomic) UILabel* fanNum;
@property (strong,nonatomic) UILabel* likeNum;

@property (strong,nonatomic) UILabel* aera;
@property (strong,nonatomic) UIButton* post;
@property (strong,nonatomic) UIButton* comment;
@property (strong,nonatomic) UIButton* favorite;
@property (strong,nonatomic) UIButton* liked;
@property (strong,nonatomic) UILabel* postLabel;
@property (strong,nonatomic) UILabel* commentLabel;
@property (strong,nonatomic) UILabel* favoriteLabel;
@property (strong,nonatomic) UILabel* likedLabel;

@property (strong,nonatomic) GLUserInfo* info;

@end


@implementation GLUserPageViewController

#pragma mark - init

- (instancetype)init {
    if(self = [super init]){
        NSString *userID = [[NSString alloc] init];
        _info=[GLUserManager getInfoBy:userID];
        self.view.backgroundColor=UIColorFromHex(0xF5F2F7);
    }
    return self;
}


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.navigationBar];
    
    [self.view addSubview:self.avatra];
    [self.view addSubview:self.gender];
    [self.view addSubview:self.setting];
    [self.view addSubview:self.userName];
    [self.view addSubview:self.userTitle];
    
    [self.view addSubview:self.follow];
    [self.view addSubview:self.fan];
    [self.view addSubview:self.like];
    
    [self.view addSubview:self.home];
    
    
    [self.view addSubview:self.oneLevel];
    [self.view addSubview:self.twoLevel];
    [self.view addSubview:self.threeLevel];
    
    [self.view addSubview:self.followNum];
    [self.view addSubview:self.fanNum];
    [self.view addSubview:self.likeNum];
    
    [self.view addSubview:self.aera];
    [self.view addSubview:self.post];
    [self.view addSubview:self.comment];
    [self.view addSubview:self.favorite];
    [self.view addSubview:self.liked];
    [self.view addSubview:self.postLabel];
    [self.view addSubview:self.commentLabel];
    [self.view addSubview:self.favoriteLabel];
    [self.view addSubview:self.likedLabel];
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    //CGFloat navHeight = [GLPostConfigurator getNavHeight];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 330);
    
    
    self.setting.frame = CGRectMake(360, 50, 30, 30);
    
    self.avatra.frame = CGRectMake(20, 120, 100, 100);
    self.userName.frame = CGRectMake(130, 130, 80, 40);
    self.gender.frame = CGRectMake(190, 140, 20, 20);
    self.oneLevel.frame = CGRectMake(300, 140, 30, 20);
    self.twoLevel.frame = CGRectMake(260, 140, 30, 20);
    self.threeLevel.frame = CGRectMake(220, 140, 30, 20);
    
    self.userTitle.frame = CGRectMake(130, 170, 120, 30);
    
    self.home.frame = CGRectMake(370, 160, 20, 20);
    
    
    self.follow.frame = CGRectMake(30, 250, 100, 60);
    self.fan.frame = CGRectMake(160, 250, 100, 60);
    self.like.frame = CGRectMake(290, 250, 100, 60);
    
    self.followNum.frame = CGRectMake(50, 270, 60, 40);
    self.fanNum.frame = CGRectMake(180, 270, 60, 40);
    self.likeNum.frame = CGRectMake(310, 270, 60, 40);
    
    self.aera.frame = CGRectMake(17, 350, self.view.frame.size.width-34, 100);
    self.post.frame = CGRectMake(42, 375, 30, 30);
    self.comment.frame = CGRectMake(142, 375, 30, 30);
    self.favorite.frame = CGRectMake(242, 375, 30, 30);
    self.liked.frame = CGRectMake(342, 375, 30, 30);
    self.postLabel.frame = CGRectMake(42, 410, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.postLabel];
    self.commentLabel.frame = CGRectMake(142, 410, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.commentLabel];
    self.favoriteLabel.frame = CGRectMake(242, 410, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.favoriteLabel];
    self.likedLabel.frame = CGRectMake(342, 410, 40, 20);
    [Utilites dynamicCalculateLabelWidth:self.likedLabel];
}

#pragma mark - response

-  (void)goMyPost:(UIButton*)sender{
    GLPostBasicTableViewController* settingVC=[[GLPostBasicTableViewController alloc] init];
//    
//    //UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
//    [self.navigationController pushViewController:settingVC animated:YES];
    GLPostBasicTableViewController* postVC=[[GLPostBasicTableViewController alloc] init];
    [self.navigationController pushViewController:postVC animated:YES];
}








-  (void)goSetting:(UIButton*)sender{
    GLSettingTableViewController* settingVC=[[GLSettingTableViewController alloc] init];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:settingVC animated:YES];
}

- (void)goFollow:(UIButton*)sender{
    NSString *userID = [[NSString alloc] init];
    GLUserListTableViewController* followVC=[[GLUserListTableViewController alloc] initFollowsBaseInfoFrom:userID];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:followVC animated:YES];
}

- (void)goFan:(UIButton*)sender{
    NSString *userID = [[NSString alloc] init];
    GLUserListTableViewController* fanVC=[[GLUserListTableViewController alloc] initFansBaseInfoFrom:userID];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:fanVC animated:YES];
}

- (void)goLike:(UIButton*)sender{
//    GLUserHomePageViewController* homeVC=[[GLUserHomePageViewController alloc] initWithUserID:@""];
//    [self.navigationController pushViewController:homeVC animated:YES];
    GLPostBasicTableViewController* postVC=[[GLPostBasicTableViewController alloc] init];
    [self.navigationController pushViewController:postVC animated:YES];
//    GLPostDetailViewController* postVC=[[GLPostDetailViewController alloc] init];
//    [self.navigationController pushViewController:postVC animated:YES];
//    GLPostSubmitViewController* postVC=[[GLPostSubmitViewController alloc] init];
//    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
//    [rootNav pushViewController:homeVC animated:YES];
}

- (void)goHome:(UIButton*)sender{
    GLUserHomePageViewController* homeVC=[[GLUserHomePageViewController alloc] initWithUserID:@""];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:homeVC animated:YES];
}

#pragma mark - getters and setters

- (UIButton*)avatra{
    if (_avatra == nil){
        _avatra=[[UIButton alloc] init];
        [_avatra setBackgroundImage:self.info.avatra forState:UIControlStateNormal];
        _avatra.layer.borderWidth=0;
        _avatra.layer.masksToBounds=YES;
        _avatra.layer.cornerRadius=[GLUserConfigurator getAvatraSize]/2;
        [_avatra addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _avatra;
}

- (UIImageView*)gender{
    if(_gender == nil){
        _gender=[[UIImageView alloc] init];
        _gender.image= [self.info.gender intValue] == 1 ? [UIImage imageNamed:@"boy"] : [UIImage imageNamed:@"girl"];
        _gender.layer.borderWidth=0;
    }
    return _gender;
}

- (UIImageView*)home{
    if (_home == nil){
        _home=[[UIImageView alloc] init];
        _home.layer.borderWidth=0;
        _home.image=[UIImage imageNamed:@"arrow"];
    }
    return _home;
}

- (UIButton*)setting{
    if (_setting == nil){
        _setting=[[UIButton alloc] init];
        _setting.layer.borderWidth=0;
        [_setting setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
        [_setting addTarget:self action:@selector(goSetting:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setting;
}

- (UIButton*)follow{
    if (_follow == nil){
        _follow=[[UIButton alloc] init];
        _follow.layer.borderWidth=0;
        [_follow setTitle:@"关注" forState:UIControlStateNormal];
        [_follow setTitleColor:UIColorFromHex(0x8854C7) forState:UIControlStateNormal];
        _follow.backgroundColor=UIColor.clearColor;
        _follow.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
        _follow.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        _follow.contentEdgeInsets=UIEdgeInsetsMake(3, 0, 0, 0);
        _follow.titleLabel.font=[GLUserConfigurator getButtonFont];
        [_follow addTarget:self action:@selector(goFollow:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _follow;
}

- (UIButton*)fan{
    if (_fan == nil){
        _fan=[[UIButton alloc] init];
        _fan.layer.borderWidth=0;
        [_fan setTitle:@"粉丝" forState:UIControlStateNormal];
        [_fan setTitleColor:UIColorFromHex(0x8854C7) forState:UIControlStateNormal];
        _fan.backgroundColor=UIColor.clearColor;
        _fan.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
        _fan.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        _fan.contentEdgeInsets=UIEdgeInsetsMake(3, 0, 0, 0);
        _fan.titleLabel.font=[GLUserConfigurator getButtonFont];
        [_fan addTarget:self action:@selector(goFan:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fan;
}

- (UIButton*)like{
    if (_like == nil){
        _like=[[UIButton alloc] init];
        
        _like.layer.borderWidth=0;
        
        [_like setTitle:@"获赞" forState:UIControlStateNormal];
        [_like setTitleColor:UIColorFromHex(0x8854C7) forState:UIControlStateNormal];
        _like.backgroundColor=UIColor.clearColor;
        
        _like.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
        _like.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        
        _like.contentEdgeInsets=UIEdgeInsetsMake(3, 0, 0, 0);
        _like.titleLabel.font=[GLUserConfigurator getButtonFont];
        [_like addTarget:self action:@selector(goLike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _like;
}

- (UILabel*)userName{
    if (_userName == nil){
        _userName=[[UILabel alloc] init];
        _userName.text=self.info.userName;
        _userName.textAlignment=NSTextAlignmentLeft;
    }
    return _userName;
}

- (UILabel*)userTitle{
    if (_userTitle == nil){
        _userTitle=[[UILabel alloc] init];
        _userTitle.text=self.info.userTitle;
        _userTitle.textAlignment=NSTextAlignmentLeft;
        _userTitle.textColor=[GLGlobalConfigurator getColorByLevel:[self.info.level intValue]];
    }
    return _userTitle;
}

- (UILabel*)oneLevel{
    if (_oneLevel == nil){
        _oneLevel=[[UILabel alloc] init];
        _oneLevel.layer.borderWidth=0;
        _oneLevel.layer.cornerRadius=[GLUserConfigurator getLevelCornerRadius];
        _oneLevel.layer.masksToBounds = YES;
        _oneLevel.backgroundColor=[GLGlobalConfigurator getLevelOneColor];
        _oneLevel.textAlignment=NSTextAlignmentCenter;
        _oneLevel.text=[NSString stringWithFormat:@"%d",[self.info.golden intValue]];
    }
    return _oneLevel;
}

- (UILabel*)twoLevel{
    if (_twoLevel == nil){
        _twoLevel=[[UILabel alloc] init];
        _twoLevel.layer.borderWidth=0;
        _twoLevel.layer.cornerRadius=[GLUserConfigurator getLevelCornerRadius];
        _twoLevel.layer.masksToBounds = YES;
        _twoLevel.backgroundColor=[GLGlobalConfigurator getLevelTwoColor];
        _twoLevel.textAlignment=NSTextAlignmentCenter;
        _twoLevel.text=[NSString stringWithFormat:@"%d",[self.info.silver intValue]];
    }
    return _twoLevel;
}

- (UILabel*)threeLevel{
    if (_threeLevel == nil){
        _threeLevel=[[UILabel alloc] init];
        _threeLevel.layer.borderWidth=0;
        _threeLevel.layer.cornerRadius=[GLUserConfigurator getLevelCornerRadius];
        _threeLevel.layer.masksToBounds = YES;
        _threeLevel.backgroundColor=[GLGlobalConfigurator getLevelThreeColor];
        _threeLevel.textAlignment=NSTextAlignmentCenter;
        _threeLevel.text=[NSString stringWithFormat:@"%d",[self.info.bronze intValue]];
    }
    return _threeLevel;
}

- (UILabel*)followNum{
    if (_followNum == nil){
        _followNum=[[UILabel alloc] init];
        _followNum.text=[NSString stringWithFormat:@"%d",[self.info.followsCount intValue]];
        _followNum.textAlignment=NSTextAlignmentCenter;
        _followNum.backgroundColor=UIColor.clearColor;
        _followNum.layer.borderWidth=0;
    }
    return _followNum;
}

- (UILabel*)fanNum{
    if (_fanNum == nil){
        _fanNum=[[UILabel alloc] init];
        _fanNum.text=[NSString stringWithFormat:@"%d",[self.info.fansCount intValue]];
        _fanNum.textAlignment=NSTextAlignmentCenter;
        _fanNum.backgroundColor=UIColor.clearColor;
        _fanNum.layer.borderWidth=0;
    }
    return _fanNum;
}

- (UILabel*)likeNum{
    if (_likeNum == nil){
        _likeNum=[[UILabel alloc] init];
        _likeNum.text=[NSString stringWithFormat:@"%d",[self.info.likeCount intValue]];
        _likeNum.textAlignment=NSTextAlignmentCenter;
        _likeNum.backgroundColor=UIColor.clearColor;
        _likeNum.layer.borderWidth=0;
    }
    return _likeNum;
}

-(UILabel*) navigationBar{
    if(_navigationBar == nil){
        _navigationBar = [[UILabel alloc] init];
        _navigationBar.backgroundColor = [GLPostConfigurator getNavColor];
    }
    return _navigationBar;
}

- (UILabel*) aera{
    if(_aera == nil){
        _aera=[[UILabel alloc] init];
        _aera.backgroundColor = UIColorFromHex(0xFFFEFF);
        _aera.layer.borderWidth=0;
        _aera.layer.masksToBounds=YES;
        _aera.layer.cornerRadius=[GLUserConfigurator getUserAeraCornerRadius];
    }
    return _aera;
}

- (UIButton*) post{
    if(_post == nil){
        _post=[[UIButton alloc] init];
        [_post setBackgroundImage:[UIImage imageNamed:@"userPost"] forState:UIControlStateNormal];
        [_post addTarget:self action:@selector(goLike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _post;
}

- (UIButton*) comment{
    if(_comment == nil){
        _comment=[[UIButton alloc] init];
        _comment.layer.borderWidth=0;
        _comment.backgroundColor=UIColor.clearColor;
        [_comment setBackgroundImage:[UIImage imageNamed:@"userComment"] forState:UIControlStateNormal];
        [_post addTarget:self action:@selector(myComment:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comment;
}

- (UIButton*) favorite{
    if(_favorite == nil){
        _favorite=[[UIButton alloc] init];
        _favorite.layer.borderWidth=0;
        _favorite.backgroundColor=UIColor.clearColor;
        [_favorite setBackgroundImage:[UIImage imageNamed:@"userFavorite"] forState:UIControlStateNormal];
        [_favorite addTarget:self action:@selector(myFavorite:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favorite;
}

- (UIButton*) liked{
    if(_liked == nil){
        _liked=[[UIButton alloc] init];
        _liked.layer.borderWidth=0;
        _liked.backgroundColor=UIColor.clearColor;
        [_liked setBackgroundImage:[UIImage imageNamed:@"userLiked"] forState:UIControlStateNormal];
        [_liked addTarget:self action:@selector(myLiked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _liked;
}

- (UILabel*) postLabel{
    if(_postLabel == nil){
        _postLabel=[[UILabel alloc] init];
        _postLabel.backgroundColor=UIColor.clearColor;
        _postLabel.text=@"帖子";
        _postLabel.layer.borderWidth=0;
        _postLabel.font=[GLUserConfigurator getUserAeraFont];
        _postLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _postLabel;
}

- (UILabel*) commentLabel{
    if(_commentLabel == nil){
        _commentLabel=[[UILabel alloc] init];
        _commentLabel.backgroundColor=UIColor.clearColor;
        _commentLabel.text=@"评论";
        _commentLabel.layer.borderWidth=0;
        _commentLabel.font=[GLUserConfigurator getUserAeraFont];
        _commentLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _commentLabel;
}

- (UILabel*) favoriteLabel{
    if(_favoriteLabel == nil){
        _favoriteLabel=[[UILabel alloc] init];
        _favoriteLabel.backgroundColor=UIColor.clearColor;
        _favoriteLabel.text=@"收藏";
        _favoriteLabel.layer.borderWidth=0;
        _favoriteLabel.font=[GLUserConfigurator getUserAeraFont];
        _favoriteLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _favoriteLabel;
}

- (UILabel*) likedLabel{
    if(_likedLabel == nil){
        _likedLabel=[[UILabel alloc] init];
        _likedLabel.backgroundColor=UIColor.clearColor;
        _likedLabel.text=@"点赞";
        _likedLabel.layer.borderWidth=0;
        _likedLabel.font=[GLUserConfigurator getUserAeraFont];
        _likedLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _likedLabel;
}

@end

