//
//  GLNoticePageViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLNoticePageViewController.h"

@interface GLNoticePageViewController ()

@property (strong,nonatomic) UIButton* like;
@property (strong,nonatomic) UIButton* reply;
@property (strong,nonatomic) UIButton* call;
@property (strong,nonatomic) UIButton* fan;
@property (strong,nonatomic) UILabel* likeLabel;
@property (strong,nonatomic) UILabel* replyLabel;
@property (strong,nonatomic) UILabel* callLabel;
@property (strong,nonatomic) UILabel* fanLabel;
@property (strong,nonatomic) UIView* likeNew;
@property (strong,nonatomic) UIView* replyNew;
@property (strong,nonatomic) UIView* callNew;
@property (strong,nonatomic) UIView* fanNew;
@property (strong, nonatomic)UILabel* folder;

@property (strong,nonatomic) GLNoticeTableViewController* unreadNotice;

@property (nonatomic,strong)UILabel* navigationBar;


@end

@implementation GLNoticePageViewController

#pragma mark - init

- (instancetype)init {
    if(self = [super init]){
    }
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.like];
    [self.view addSubview:self.reply];
    [self.view addSubview:self.call];
    [self.view addSubview:self.fan];
    [self.view addSubview:self.likeLabel];
    [self.view addSubview:self.replyLabel];
    [self.view addSubview:self.callLabel];
    [self.view addSubview:self.fanLabel];
    [self.view addSubview:self.likeNew];
    [self.view addSubview:self.replyNew];
    [self.view addSubview:self.callNew];
    [self.view addSubview:self.fanNew];
    [self.view addSubview:self.unreadNotice.view];
    [self.view addSubview:self.folder];
    [self addChildViewController:self.unreadNotice];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    CGFloat navHeight = [GLPostConfigurator getNavHeight];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, navHeight);
    
    CGFloat length = self.view.frame.size.width - 30*2;
    length/=4;
    CGFloat x = 30-length/2;
    
    CGRect btnInit = CGRectMake(0,navHeight+20,60,60);
    CGRect labelInit = CGRectMake(0,navHeight+80,60,30);
    
    self.like.frame=btnInit;
    self.likeLabel.frame=labelInit;
    self.like.center=CGPointMake(x+=length, self.like.center.y);
    self.likeLabel.center=CGPointMake(x, self.likeLabel.center.y);
    
    self.reply.frame=btnInit;
    self.replyLabel.frame=labelInit;
    self.reply.center=CGPointMake(x+=length, self.reply.center.y);
    self.replyLabel.center=CGPointMake(x, self.replyLabel.center.y);
    
    self.call.frame=btnInit;
    self.callLabel.frame=labelInit;
    self.call.center=CGPointMake(x+=length, self.call.center.y);
    self.callLabel.center=CGPointMake(x, self.callLabel.center.y);
    
    self.fan.frame=btnInit;
    self.fanLabel.frame=labelInit;
    self.fan.center=CGPointMake(x+=length, self.fan.center.y);
    self.fanLabel.center=CGPointMake(x, self.fanLabel.center.y);
    
    
    //39+60-8 177+60-8 315+60-8
    CGFloat y = self.like.frame.origin.y;
    self.likeNew.frame=CGRectMake(self.like.frame.origin.x+self.like.frame.size.width-8, y, 10, 10);
    self.replyNew.frame=CGRectMake(self.reply.frame.origin.x+self.reply.frame.size.width-8, y, 10, 10);
    self.callNew.frame=CGRectMake(self.call.frame.origin.x+self.call.frame.size.width-8, y, 10, 10);
    self.fanNew.frame=CGRectMake(self.fan.frame.origin.x+self.fan.frame.size.width-8, y, 10, 10);

    y = navHeight+120;
    self.folder.frame =CGRectMake(0, y, self.view.frame.size.width, 15);
    CGRect frame = self.view.frame;
    frame.origin.y = y;
    frame.size.height -= y;
    self.unreadNotice.view.frame = frame;
}

#pragma mark - response

- (void)goLike:(UIButton*)sender{
    GLNoticeTableViewController* likeVC=[[GLNoticeTableViewController alloc] initWithNotices:[GLNoticeManager getLikeNotice]];
    [self.navigationController pushViewController:likeVC animated:YES];
}

- (void)goReply:(UIButton*)sender{
    GLNoticeTableViewController* replyVC=[[GLNoticeTableViewController alloc] initWithNotices:[GLNoticeManager getReplyNotice]];
    [self.navigationController pushViewController:replyVC animated:YES];
}

- (void)goCall:(UIButton*)sender{
    GLNoticeTableViewController* callVC=[[GLNoticeTableViewController alloc] initWithNotices:[GLNoticeManager getCallNotice]];
    [self.navigationController pushViewController:callVC animated:YES];
}

- (void)goFan:(UIButton*)sender{
    GLNoticeTableViewController* fanVC=[[GLNoticeTableViewController alloc] initWithNotices:[GLNoticeManager getFollowNotice]];
    [self.navigationController pushViewController:fanVC animated:YES];
}

#pragma mark - getters and setters

- (UIButton*)like{
    if(_like == nil){
        _like=[[UIButton alloc] init];
        UIImageView* logo=[[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        logo.image=[UIImage imageNamed:@"noticeLike"];
        [_like addSubview:logo];
        _like.backgroundColor=[GLNoticeConfigurator getLikeButtonColor];
        _like.layer.cornerRadius=[GLNoticeConfigurator getButtonRadius];
        _like.layer.masksToBounds=YES;
        [_like addTarget:self action:@selector(goLike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _like;
}

- (UIButton*)reply{
    if(_reply == nil){
        _reply=[[UIButton alloc] init];
        UIImageView* logo=[[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        logo.image=[UIImage imageNamed:@"noticeReply"];
        [_reply addSubview:logo];
        _reply.backgroundColor=[GLNoticeConfigurator getReplyButtonColor];
        _reply.layer.cornerRadius=[GLNoticeConfigurator getButtonRadius];
        _reply.layer.masksToBounds=YES;
        [_reply addTarget:self action:@selector(goReply:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reply;
}



- (UIButton*)call{
    if(_call == nil){
        _call=[[UIButton alloc] init];
        UIImageView* logo=[[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        logo.image=[UIImage imageNamed:@"noticeCall"];
        [_call addSubview:logo];
        _call.backgroundColor=[GLNoticeConfigurator getCallButtonColor];
        _call.layer.cornerRadius=[GLNoticeConfigurator getButtonRadius];
        _call.layer.masksToBounds=YES;
        [_call addTarget:self action:@selector(goCall:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _call;
}

- (UIButton*)fan{
    if(_fan == nil){
        _fan=[[UIButton alloc] init];
        UIImageView* logo=[[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        logo.image=[UIImage imageNamed:@"noticeFan"];
        [_fan addSubview:logo];
        _fan.backgroundColor=[GLNoticeConfigurator getFanButtonColor];
        _fan.layer.cornerRadius=[GLNoticeConfigurator getButtonRadius];
        _fan.layer.masksToBounds=YES;
        [_fan addTarget:self action:@selector(goFan:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fan;
}

- (UILabel*)likeLabel{
    if(_likeLabel == nil){
        _likeLabel=[[UILabel alloc] init];
        _likeLabel.text=@"点赞";
        _likeLabel.backgroundColor=UIColor.clearColor;
        _likeLabel.layer.borderWidth=0;
        _likeLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _likeLabel;
}

- (UILabel*)replyLabel{
    if(_replyLabel == nil){
        _replyLabel=[[UILabel alloc] init];
        _replyLabel.text=@"回复";
        _replyLabel.backgroundColor=UIColor.clearColor;
        _replyLabel.layer.borderWidth=0;
        _replyLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _replyLabel;
}

- (UILabel*)callLabel{
    if(_callLabel == nil){
        _callLabel=[[UILabel alloc] init];
        _callLabel.text=@"提到";
        _callLabel.backgroundColor=UIColor.clearColor;
        _callLabel.layer.borderWidth=0;
        _callLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _callLabel;
}

- (UILabel*)fanLabel{
    if(_fanLabel == nil){
        _fanLabel=[[UILabel alloc] init];
        _fanLabel.text=@"粉丝";
        _fanLabel.backgroundColor=UIColor.clearColor;
        _fanLabel.layer.borderWidth=0;
        _fanLabel.textAlignment=NSTextAlignmentCenter;
        
    }
    return _fanLabel;
}

- (UIView*)likeNew{
    if(_likeNew == nil){
        _likeNew=[[UIView alloc] init];
        _likeNew.backgroundColor=[GLNoticeConfigurator getRedDotColor];
        _likeNew.layer.masksToBounds=YES;
        _likeNew.layer.cornerRadius=[GLNoticeConfigurator getNoticeRedDotWidth]/2;
        //if(self.manager.likeNew == 0) _likeNew.hidden=YES;
    }
    return _likeNew;
}

- (UIView*)replyNew{
    if(_replyNew == nil){
        _replyNew=[[UIView alloc] init];
        _replyNew.backgroundColor=[GLNoticeConfigurator getRedDotColor];
        _replyNew.layer.masksToBounds=YES;
        _replyNew.layer.cornerRadius=[GLNoticeConfigurator getNoticeRedDotWidth]/2;
        //if(self.manager.replyNew == 0) _replyNew.hidden=YES;
    }
    return _replyNew;
}


- (UIView*)callNew{
    if(_callNew == nil){
        _callNew=[[UIView alloc] init];
        _callNew.backgroundColor=[GLNoticeConfigurator getRedDotColor];
        _callNew.layer.masksToBounds=YES;
        _callNew.layer.cornerRadius=[GLNoticeConfigurator getNoticeRedDotWidth]/2;
        //if(self.manager.replyNew == 0) _replyNew.hidden=YES;
    }
    return _callNew;
}

- (UIView*)fanNew{
    if(_fanNew == nil){
        _fanNew=[[UIView alloc] init];
        _fanNew.backgroundColor=[GLNoticeConfigurator getRedDotColor];
        _fanNew.layer.masksToBounds=YES;
        _fanNew.layer.cornerRadius=[GLNoticeConfigurator getNoticeRedDotWidth]/2;
        //if(self.manager.fanNew == 0) _fanNew.hidden=YES;
    }
    return _fanNew;
}

-(GLNoticeTableViewController*)unreadNotice{
    if (_unreadNotice==nil){
        _unreadNotice = [[GLNoticeTableViewController alloc] initWithNotices:[GLNoticeManager getUnreadNotice]];
    }
    return _unreadNotice;
}

-(UILabel*) navigationBar{
    if(_navigationBar==nil){
        _navigationBar = [[UILabel alloc] init];
        _navigationBar.backgroundColor = [GLPostConfigurator getNavColor];
    }
    return _navigationBar;
}

-(UILabel*)folder{
    if(_folder==nil){
        _folder = [[UILabel alloc] init];
        _folder.backgroundColor = [UIColor whiteColor];
    }
    return _folder;
}


@end
