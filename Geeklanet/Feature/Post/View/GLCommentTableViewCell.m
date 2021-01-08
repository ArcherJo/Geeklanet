//
//  GLCommentTableViewCell.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLCommentTableViewCell.h"

@interface GLCommentTableViewCell ()

@property (strong,nonatomic) UIButton* avatra;
@property (strong,nonatomic) UIButton* follow;
@property (strong,nonatomic) UIButton* favorite;
@property (strong,nonatomic) UIButton* like;
@property (strong,nonatomic) UIButton* unlike;
@property (strong,nonatomic) UIButton* delete;
@property (strong,nonatomic) UIButton* comment;
@property (strong,nonatomic) UIImageView* gender;
@property (strong,nonatomic) UILabel* name;
@property (strong,nonatomic) UILabel* title;
@property (strong,nonatomic) UILabel* oneNum;
@property (strong,nonatomic) UILabel* twoNum;
@property (strong,nonatomic) UILabel* threeNum;
@property (strong,nonatomic) UILabel* likeNum;
@property (strong,nonatomic) UILabel* time;
@property (strong,nonatomic) UILabel* content;
@property (strong,nonatomic) UIView* oneView;
@property (strong,nonatomic) UIView* twoView;
@property (strong,nonatomic) UIView* threeView;

@property (nonatomic) int likeStatus;
@property (nonatomic) int followStatus;
@property (nonatomic) CGFloat height;

@end

@implementation GLCommentTableViewCell

#pragma mark - init

- (instancetype)initWithGLComment:(GLComment*)comment{
    if(self = [super init]){
        self.likeStatus=0;
        self.followStatus=0;
        self.avatra=[[UIButton alloc] init];
        self.follow=[[UIButton alloc] init];
        self.favorite=[[UIButton alloc] init];
        self.like=[[UIButton alloc] init];
        self.unlike=[[UIButton alloc] init];
        self.delete=[[UIButton alloc] init];
        self.comment=[[UIButton alloc] init];
        self.gender=[[UIImageView alloc] init];
        self.name=[[UILabel alloc] init];
        self.title=[[UILabel alloc] init];
        self.oneNum=[[UILabel alloc] init];
        self.twoNum=[[UILabel alloc] init];
        self.threeNum=[[UILabel alloc] init];
        self.likeNum=[[UILabel alloc] init];
        self.time=[[UILabel alloc] init];
        self.content=[[UILabel alloc] init];
        self.oneView=[[UIView alloc] init];
        self.twoView=[[UIView alloc] init];
        self.threeView=[[UIView alloc] init];
        
        [self.avatra setBackgroundImage:comment.avatra forState:UIControlStateNormal];
        self.avatra.layer.masksToBounds=YES;
        self.avatra.layer.borderWidth=0;
        self.avatra.layer.cornerRadius=[GLPostConfigurator getCommentAvatraWidth]/2;
        [self.avatra addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
        
        self.follow.backgroundColor=[GLPostConfigurator getFollowButtonColor];
        [self.follow setTitle:@"+关注" forState:UIControlStateNormal];
        [self.follow setTintColor:UIColor.whiteColor];
        self.follow.layer.cornerRadius=[GLPostConfigurator getCommentFollowButtonCornerDadius];
        self.follow.layer.borderWidth=0;
        self.follow.layer.masksToBounds=YES;
        [self.follow addTarget:self action:@selector(followUser:) forControlEvents:UIControlEventTouchUpInside];
        
        self.gender.image=comment.gender;
        self.gender.backgroundColor=UIColor.clearColor;
        self.gender.layer.borderWidth=0;
        
        self.name.text=comment.name;
        self.name.backgroundColor=UIColor.clearColor;
        self.name.font=[UIFont systemFontOfSize:20];
        self.name.textAlignment=NSTextAlignmentLeft;
        
        self.title.text=comment.title;
        self.title.textColor=[GLGlobalConfigurator getColorByLevel:comment.level];
        self.title.font=[UIFont systemFontOfSize:16];
        self.title.backgroundColor=UIColor.clearColor;
        self.title.layer.borderWidth=0;
        self.title.textAlignment=NSTextAlignmentLeft;
        
        self.oneNum.text=[NSString stringWithFormat:@"%d",comment.one];
        self.oneNum.font=[UIFont systemFontOfSize:15];
        self.oneNum.textAlignment=NSTextAlignmentLeft;
        self.oneNum.backgroundColor=UIColor.clearColor;
        self.oneNum.layer.borderWidth=0;
        
        self.twoNum.text=[NSString stringWithFormat:@"%d",comment.two];
        self.twoNum.font=[UIFont systemFontOfSize:15];
        self.twoNum.textAlignment=NSTextAlignmentLeft;
        self.twoNum.backgroundColor=UIColor.clearColor;
        self.twoNum.layer.borderWidth=0;
        
        self.threeNum.text=[NSString stringWithFormat:@"%d",comment.three];
        self.threeNum.font=[UIFont systemFontOfSize:15];
        self.threeNum.textAlignment=NSTextAlignmentLeft;
        self.threeNum.backgroundColor=UIColor.clearColor;
        self.threeNum.layer.borderWidth=0;
        
        self.oneView.backgroundColor=[GLGlobalConfigurator getLevelOneColor];
        self.oneView.layer.masksToBounds=YES;
        self.oneView.layer.borderWidth=0;
        self.oneView.layer.cornerRadius=[GLPostConfigurator getCommentDotViewHeight]/2;
        
        self.twoView.backgroundColor=[GLGlobalConfigurator getLevelTwoColor];
        self.twoView.layer.masksToBounds=YES;
        self.twoView.layer.borderWidth=0;
        self.twoView.layer.cornerRadius=[GLPostConfigurator getCommentDotViewHeight]/2;
        
        self.threeView.backgroundColor=[GLGlobalConfigurator getLevelThreeColor];
        self.threeView.layer.masksToBounds=YES;
        self.threeView.layer.borderWidth=0;
        self.threeView.layer.cornerRadius=[GLPostConfigurator getCommentDotViewHeight]/2;
        
        int currWidth=88;
        self.avatra.frame=CGRectMake(20, 10, 60, 60);
        self.follow.frame=CGRectMake(330, 25, 60, 30);
        self.title.frame=CGRectMake(88, 40, 200, 25);
        self.name.frame=CGRectMake(88, 15, 100, 20);
        [Utilites dynamicCalculateLabelWidth:self.name];
        currWidth=currWidth+self.name.frame.size.width+5;
        self.gender.frame=CGRectMake(currWidth, 15, 20, 20);
        currWidth=currWidth+35;
        self.threeView.frame=CGRectMake(currWidth, 22, 8, 8);
        currWidth=currWidth+11;
        self.threeNum.frame=CGRectMake(currWidth, 17, 20, 15);
        [Utilites dynamicCalculateLabelWidth:self.threeNum];
        currWidth=currWidth+self.threeNum.frame.size.width+10;
        self.twoView.frame=CGRectMake(currWidth, 22, 8, 8);
        currWidth=currWidth+11;
        self.twoNum.frame=CGRectMake(currWidth, 17, 20, 15);
        [Utilites dynamicCalculateLabelWidth:self.twoNum];
        currWidth=currWidth+self.twoNum.frame.size.width+10;
        self.oneView.frame=CGRectMake(currWidth, 22, 8, 8);
        currWidth=currWidth+11;
        self.oneNum.frame=CGRectMake(currWidth, 17, 20, 15);
        [Utilites dynamicCalculateLabelWidth:self.oneNum];
        
        if(self.likeStatus == 1) [self.like setBackgroundImage:[UIImage imageNamed:@"commentLikeFill"] forState:UIControlStateNormal];
        else [self.like setBackgroundImage:[UIImage imageNamed:@"commentLike"] forState:UIControlStateNormal];
        self.like.backgroundColor=UIColor.clearColor;
        self.like.layer.borderWidth=0;
        if(self.likeStatus == -1) [self.like setUserInteractionEnabled:NO];
        [self.like addTarget:self action:@selector(clickLike:) forControlEvents:UIControlEventTouchUpInside];
        
        if(self.likeStatus == -1) [self.unlike setBackgroundImage:[UIImage imageNamed:@"commentUnLikeFill"] forState:UIControlStateNormal];
        else [self.unlike setBackgroundImage:[UIImage imageNamed:@"commentUnLike"] forState:UIControlStateNormal];
        self.unlike.backgroundColor=UIColor.clearColor;
        self.unlike.layer.borderWidth=0;
        if(self.likeStatus == 1) [self.unlike setUserInteractionEnabled:NO];
        [self.unlike addTarget:self action:@selector(clickUnLike:) forControlEvents:UIControlEventTouchUpInside];
        
        self.likeNum.text=[NSString stringWithFormat:@"%d",comment.likeNum];
        self.likeNum.font=[UIFont systemFontOfSize:18];
        self.likeNum.backgroundColor=UIColor.clearColor;
        self.likeNum.textColor=UIColorFromHex(0x707070);
        self.likeNum.textAlignment=NSTextAlignmentCenter;
        
        self.like.frame=CGRectMake(15, 80, 30, 20);
        self.likeNum.frame=CGRectMake(0, 100, 40, 20);
        [Utilites dynamicCalculateLabelWidth:self.likeNum];
        self.likeNum.center=CGPointMake(30, 110);
        self.unlike.frame=CGRectMake(15, 120, 30, 20);
        
        self.content.text=comment.content;
        self.content.backgroundColor=UIColor.clearColor;
        self.content.layer.borderWidth=0;
        self.content.font=[UIFont systemFontOfSize:16];
        self.content.numberOfLines=0;
        self.content.frame=CGRectMake(68, 82, 315, 0);
        [Utilites dynamicCalculateLabelHight:self.content maxLine:1000];
        self.height=82+self.content.frame.size.height+10;
        [self addImageViewInContentView:comment.pictures];
        
        if(self.height < 145) self.height=145;
        [self.favorite setBackgroundImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
        self.favorite.backgroundColor=UIColor.clearColor;
        self.favorite.layer.borderWidth=0;
        
        [self.delete setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        self.delete.backgroundColor=UIColor.clearColor;
        self.delete.layer.borderWidth=0;
        
        self.time.text=comment.time;
        self.time.backgroundColor=UIColor.clearColor;
        self.time.font=[UIFont systemFontOfSize:14];
        self.time.textColor=UIColorFromHex(0x909090);
        self.time.textAlignment=NSTextAlignmentLeft;
        
        [self.comment setBackgroundImage:[UIImage imageNamed:@"reply"] forState:UIControlStateNormal];
        self.comment.backgroundColor=UIColor.clearColor;
        self.comment.layer.borderWidth=0;
        
        self.favorite.frame=CGRectMake(5, self.height,  25, 25);
        self.delete.frame=CGRectMake(35, self.height, 25, 25);
        self.comment.frame=CGRectMake(378, self.height, 25, 25);
        self.time.frame=CGRectMake(68, self.height+8, 100, 15);
        [Utilites dynamicCalculateLabelHight:self.time maxLine:1];
        self.height=self.height+35;
        
        
        [self.contentView addSubview:self.avatra];
        [self.contentView addSubview:self.follow];
        [self.contentView addSubview:self.favorite];
        [self.contentView addSubview:self.like];
        [self.contentView addSubview:self.unlike];
        [self.contentView addSubview:self.delete];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.gender];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.oneNum];
        [self.contentView addSubview:self.twoNum];
        [self.contentView addSubview:self.threeNum];
        [self.contentView addSubview:self.likeNum];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.comment];
        [self.contentView addSubview:self.oneView];
        [self.contentView addSubview:self.twoView];
        [self.contentView addSubview:self.threeView];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - 

#pragma mark - count height

- (CGFloat)getCellHeight{
    return self.height;
}

#pragma mark- add image

- (void)addImageViewInContentView:(NSMutableArray*)pictures{
    int cnt=(int)pictures.count;
    if(cnt == 0) return;
    else if(cnt == 1){
        UIImageView* picture=[[UIImageView alloc] init];
        picture.image=pictures[0];
        picture.frame=CGRectMake(123, self.height, 205, 205);
        [self.contentView addSubview:picture];
        self.height=self.height+215;
    }else if(cnt == 2){
        UIImageView* picture1=[[UIImageView alloc] init];
        UIImageView* picture2=[[UIImageView alloc] init];
        picture1.image=pictures[0];
        picture2.image=pictures[1];
        picture1.frame=CGRectMake(98, self.height, 120, 120);
        picture2.frame=CGRectMake(233, self.height, 120, 120);
        [self.contentView addSubview:picture1];
        [self.contentView addSubview:picture2];
        self.height=self.height+130;
    }else if(cnt == 4){
        UIImageView* picture1=[[UIImageView alloc] init];
        UIImageView* picture2=[[UIImageView alloc] init];
        UIImageView* picture3=[[UIImageView alloc] init];
        UIImageView* picture4=[[UIImageView alloc] init];
        picture1.image=pictures[0];
        picture2.image=pictures[1];
        picture3.image=pictures[2];
        picture4.image=pictures[3];
        picture1.frame=CGRectMake(98, self.height, 120, 120);
        picture2.frame=CGRectMake(233, self.height, 120, 120);
        [self.contentView addSubview:picture1];
        [self.contentView addSubview:picture2];
        self.height=self.height+135;
        picture3.frame=CGRectMake(98, self.height, 120, 120);
        picture4.frame=CGRectMake(233, self.height, 120, 120);
        [self.contentView addSubview:picture3];
        [self.contentView addSubview:picture4];
        self.height=self.height+130;
    }else{
        for(int i=1;i<=cnt;i++){
            UIImageView* picture=[[UIImageView alloc] init];
            picture.image=pictures[i-1];
            int row=(i-1)/3,col=(i+2)%3;
            picture.frame=CGRectMake(76+col*105, self.height+row*105, 90, 90);
            [self.contentView addSubview:picture];
        }
        self.height=self.height+(cnt-1)/3*105+100;
    }
}

#pragma mark - response

- (void)goHome:(UIButton*)sender{
    GLUserHomePageViewController* homeVC=[[GLUserHomePageViewController alloc] initWithUserID:@""];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:homeVC animated:YES];
}

#pragma mark- - response

- (void)clickLike:(UIButton*)sender{
    if(self.likeStatus==0){
        self.likeStatus=1;
         [self.unlike setUserInteractionEnabled:NO];
        [self.like setBackgroundImage:[UIImage imageNamed:@"commentLikeFill"] forState:UIControlStateNormal];
    }else if (self.likeStatus==1){
        self.likeStatus=0;
        [self.unlike setUserInteractionEnabled:YES];
        [self.like setBackgroundImage:[UIImage imageNamed:@"commentLike"] forState:UIControlStateNormal];
    }
}

- (void)clickUnLike:(UIButton*)sender{
    if(self.likeStatus==0){
        self.likeStatus=-1;
        [self.like setUserInteractionEnabled:NO];
        [self.unlike setBackgroundImage:[UIImage imageNamed:@"commentUnLikeFill"] forState:UIControlStateNormal];
    }else if (self.likeStatus==-1){
        self.likeStatus=0;
        [self.like setUserInteractionEnabled:YES];
        [self.unlike setBackgroundImage:[UIImage imageNamed:@"commentUnLike"] forState:UIControlStateNormal];
    }
}

- (void)followUser:(UIButton*)sender{
    if(self.followStatus == 0){
        [self.follow setTitle:@"已关注" forState:UIControlStateNormal];
        self.followStatus=1;
        self.follow.backgroundColor=UIColorFromHex(0x707070);
    }else if(self.followStatus == 1){
        [self.follow setTitle:@"+关注" forState:UIControlStateNormal];
        self.followStatus=0;
        self.follow.backgroundColor=[GLPostConfigurator getFollowButtonColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
