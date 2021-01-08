//
//  GLPostBasicTableViewCell.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostBasicTableViewCell.h"

@interface GLPostBasicTableViewCell ()

@property (strong,nonatomic) UIButton* avatra;
@property (strong,nonatomic) UIImageView* gender;
@property (strong,nonatomic) UIImageView* picture;
@property (strong,nonatomic) UILabel* title;
@property (strong,nonatomic) UILabel* userName;
@property (strong,nonatomic) UILabel* userTitle;
@property (strong,nonatomic) UILabel* content;
@property (strong,nonatomic) UILabel* oneNum;
@property (strong,nonatomic) UILabel* twoNum;
@property (strong,nonatomic) UILabel* threeNum;
@property (strong,nonatomic) UILabel* time;
@property (strong,nonatomic) UILabel* tag1;
@property (strong,nonatomic) UILabel* tag2;
@property (strong,nonatomic) UILabel* tag3;
@property (strong,nonatomic) UIView* lineView;
@property (strong,nonatomic) UIView* typeView;
@property (strong,nonatomic) UIView* oneView;
@property (strong,nonatomic) UIView* twoView;
@property (strong,nonatomic) UIView* threeView;

@property (nonatomic) CGFloat height;

@end

@implementation GLPostBasicTableViewCell

- (instancetype)initWithGLPostBasic:(GLPostBasic*)post{
    if(self = [super init]){
        self.avatra=[[UIButton alloc] init];
        self.gender=[[UIImageView alloc] init];
        self.picture=[[UIImageView alloc] init];
        self.title=[[UILabel alloc] init];
        self.userName=[[UILabel alloc] init];
        self.userTitle=[[UILabel alloc] init];
        self.content=[[UILabel alloc] init];
        self.oneNum=[[UILabel alloc] init];
        self.twoNum=[[UILabel alloc] init];
        self.threeNum=[[UILabel alloc] init];
        self.time=[[UILabel alloc] init];
        self.tag1=[[UILabel alloc] init];
        self.tag2=[[UILabel alloc] init];
        self.tag3=[[UILabel alloc] init];
        self.lineView=[[UIView alloc] init];
        self.typeView=[[UIView alloc] init];
        self.oneView=[[UIView alloc] init];
        self.twoView=[[UIView alloc] init];
        self.threeView=[[UIView alloc] init];
        
        [self.avatra setBackgroundImage:post.avatra forState:UIControlStateNormal];
        self.avatra.layer.masksToBounds=YES;
        self.avatra.layer.cornerRadius=[GLPostConfigurator getPostBasicAvatraWidth]/2;
        self.avatra.layer.borderWidth=0;
        [self.avatra addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
        
        self.gender.image=post.gender;
        self.gender.layer.masksToBounds=YES;
        self.gender.layer.cornerRadius=10;
        self.gender.layer.borderWidth=0;
        
        self.userName.text=post.name;
        self.userName.font=[UIFont systemFontOfSize:20];
        self.userName.backgroundColor=UIColor.clearColor;
        self.userName.layer.borderWidth=0;
        self.userName.textAlignment=NSTextAlignmentLeft;
        
        self.userTitle.text=post.userTitle;
        self.userTitle.backgroundColor=UIColor.clearColor;
        self.userTitle.font=[UIFont systemFontOfSize:16];
        self.userTitle.textColor=[GLGlobalConfigurator getColorByLevel:post.level];
        self.userTitle.layer.borderWidth=0;
        self.userTitle.textAlignment=NSTextAlignmentLeft;
        
        self.oneNum.text=[NSString stringWithFormat:@"%d",post.one];
        self.oneNum.font=[UIFont systemFontOfSize:14];
        self.oneNum.textAlignment=NSTextAlignmentLeft;
        self.oneNum.backgroundColor=UIColor.clearColor;
        self.oneNum.layer.borderWidth=0;
        
        self.twoNum.text=[NSString stringWithFormat:@"%d",post.two];
        self.twoNum.font=[UIFont systemFontOfSize:14];
        self.twoNum.textAlignment=NSTextAlignmentLeft;
        self.twoNum.backgroundColor=UIColor.clearColor;
        self.twoNum.layer.borderWidth=0;
        
        self.threeNum.text=[NSString stringWithFormat:@"%d",post.three];
        self.threeNum.font=[UIFont systemFontOfSize:14];
        self.threeNum.textAlignment=NSTextAlignmentLeft;
        self.threeNum.backgroundColor=UIColor.clearColor;
        self.threeNum.layer.borderWidth=0;
        
        self.oneView.backgroundColor=[GLGlobalConfigurator getLevelOneColor];
        self.oneView.layer.masksToBounds=YES;
        self.oneView.layer.borderWidth=0;
        self.oneView.layer.cornerRadius=[GLPostConfigurator getPostDotViewHeight]/2;
        
        self.twoView.backgroundColor=[GLGlobalConfigurator getLevelTwoColor];
        self.twoView.layer.masksToBounds=YES;
        self.twoView.layer.borderWidth=0;
        self.twoView.layer.cornerRadius=[GLPostConfigurator getPostDotViewHeight]/2;
        
        self.threeView.backgroundColor=[GLGlobalConfigurator getLevelThreeColor];
        self.threeView.layer.masksToBounds=YES;
        self.threeView.layer.borderWidth=0;
        self.threeView.layer.cornerRadius=[GLPostConfigurator getPostDotViewHeight]/2;
        
        self.avatra.frame=CGRectMake(10, 10, 60, 60);
        self.userName.frame=CGRectMake(10, 78, 100, 20);
        [Utilites dynamicCalculateLabelWidth:self.userName];
        self.gender.frame=CGRectMake(12+self.userName.frame.size.width, 77, 20, 20);
        self.userTitle.frame=CGRectMake(10, 105, 100, 20);
        self.oneNum.frame=CGRectMake(80, 129, 30, 20);
        [Utilites dynamicCalculateLabelWidth:self.oneNum];
        self.twoNum.frame=CGRectMake(50, 129, 30, 20);
        [Utilites dynamicCalculateLabelWidth:self.twoNum];
        self.threeNum.frame=CGRectMake(20, 129, 30, 20);
        [Utilites dynamicCalculateLabelWidth:self.threeNum];
        self.oneView.frame=CGRectMake(70, 135, 8, 8);
        self.twoView.frame=CGRectMake(40, 135, 8, 8);
        self.threeView.frame=CGRectMake(10, 135, 8, 8);
        
        self.title.text=[NSString stringWithFormat:@"%@: %@",post.type,post.title];
        self.title.font=[UIFont systemFontOfSize:19];
        self.title.backgroundColor=UIColor.clearColor;
        self.title.layer.borderWidth=0;
        self.title.numberOfLines=2;
        self.title.textAlignment=NSTextAlignmentLeft;
        self.title.frame=CGRectMake(120, 10, 280, 60);
        [Utilites dynamicCalculateLabelHight:self.title maxLine:2];
        self.height=15+self.title.frame.size.height;
        
        
        self.picture.image=post.picture;
        self.picture.layer.borderWidth=0;
        
        self.content.text=post.content;
        self.content.backgroundColor=UIColor.clearColor;
        self.content.textColor=UIColor.grayColor;
        self.content.font=[UIFont systemFontOfSize:16];
        self.content.layer.borderWidth=0;
        self.content.numberOfLines=0;
        self.content.textAlignment=NSTextAlignmentLeft;
        
        if(post.havePic){
            self.picture.frame=CGRectMake(320, self.height, 80, 80);
            self.content.frame=CGRectMake(120, self.height, 190, 80);
            self.height=self.height+85;
        }else{
            self.picture.frame=CGRectMake(320, self.height, 0, 0);
            self.content.frame=CGRectMake(120, self.height, 280, 80);
            [Utilites dynamicCalculateLabelHight:self.content maxLine:5];
            self.height=self.height+5+self.content.frame.size.height;
        }
        
        CGFloat currWidth=120;
        UIColor* tagColor = UIColorFromHex(0xFFF8C4);
        self.tag1.text=[NSString stringWithFormat:@"#%@",post.tags[0]];
        self.tag1.font=[UIFont systemFontOfSize:14];
        self.tag1.backgroundColor=tagColor;
        self.tag1.layer.masksToBounds=YES;
        self.tag1.layer.borderWidth=0;
        self.tag1.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        self.tag1.textAlignment=NSTextAlignmentCenter;
        if([self.tag1.text isEqualToString:@"#"]){
            self.tag1.frame=CGRectMake(currWidth, self.height, 0, 0);
        }else{
            self.tag1.frame=CGRectMake(currWidth, self.height, 40, 20);
            [Utilites dynamicCalculateLabelWidth:self.tag1];
            CGRect frame=self.tag1.frame;
            frame.size.width+=8;
            self.tag1.frame=frame;
            currWidth=currWidth+self.tag1.frame.size.width+5;
        }
        
        self.tag2.text=[NSString stringWithFormat:@"#%@",post.tags[1]];
        self.tag2.font=[UIFont systemFontOfSize:14];
        self.tag2.backgroundColor=tagColor;
        self.tag2.layer.masksToBounds=YES;
        self.tag2.layer.borderWidth=0;
        self.tag2.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        self.tag2.textAlignment=NSTextAlignmentCenter;
        if([self.tag2.text isEqualToString:@"#"]){
            self.tag2.frame=CGRectMake(currWidth, self.height, 0, 0);
        }else{
            self.tag2.frame=CGRectMake(currWidth, self.height, 40, 20);
            [Utilites dynamicCalculateLabelWidth:self.tag2];
            CGRect frame=self.tag2.frame;
            frame.size.width+=8;
            self.tag2.frame=frame;
            currWidth=currWidth+self.tag2.frame.size.width+5;
        }
        
        self.tag3.text=[NSString stringWithFormat:@"#%@",post.tags[2]];
        self.tag3.font=[UIFont systemFontOfSize:14];
        self.tag3.backgroundColor=tagColor;
        self.tag3.layer.masksToBounds=YES;
        self.tag3.layer.borderWidth=0;
        self.tag3.layer.cornerRadius=[GLPostConfigurator getPostTagViewRadius];
        self.tag3.textAlignment=NSTextAlignmentCenter;
        if([self.tag3.text isEqualToString:@"#"]){
            self.tag3.frame=CGRectMake(currWidth, self.height, 0, 0);
        }else{
            self.tag3.frame=CGRectMake(currWidth, self.height, 40, 20);
            [Utilites dynamicCalculateLabelWidth:self.tag3];
            CGRect frame=self.tag3.frame;
            frame.size.width+=8;
            self.tag3.frame=frame;
        }
        self.height=self.height+25;
        
        self.time.text=[NSString stringWithFormat:@"点赞数%d · 评论数%d · %@",post.likeNum,post.commentNum,post.time];
        self.time.backgroundColor=UIColor.clearColor;
        self.time.font=[UIFont systemFontOfSize:14];
        self.time.textColor=UIColorFromHex(0x909090);
        self.time.textAlignment=NSTextAlignmentLeft;
        if(self.height<153) self.height=153;
        self.time.frame=CGRectMake(105, self.height, 200, 20);
        [Utilites dynamicCalculateLabelWidth:self.time];
        
        self.lineView.backgroundColor= UIColorFromHex(0x91F2FF);
        self.lineView.layer.borderWidth=0;
        self.lineView.frame=CGRectMake(110, 10, 3, self.height-14);
        self.height=self.height+30;
        
        self.typeView.backgroundColor=[GLPostConfigurator getColorByType:post.type];
        self.typeView.layer.cornerRadius=10;
        self.typeView.layer.masksToBounds=YES;
        self.typeView.layer.borderWidth=0;
        self.typeView.frame=CGRectMake(117, 11, 50, 22);
        
        
        [self.contentView addSubview:self.typeView];
        [self.contentView addSubview:self.avatra];
        [self.contentView addSubview:self.gender];
        [self.contentView addSubview:self.picture];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userTitle];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.oneNum];
        [self.contentView addSubview:self.twoNum];
        [self.contentView addSubview:self.threeNum];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.tag1];
        [self.contentView addSubview:self.tag2];
        [self.contentView addSubview:self.tag3];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.oneView];
        [self.contentView addSubview:self.twoView];
        [self.contentView addSubview:self.threeView];
        self.contentView.backgroundColor=[GLPostConfigurator getPostBasicCellColor];
    }
    return self;
}

#pragma mark - count hegiht

- (CGFloat)getCellHeight{
    return self.height;
}

#pragma mark - response

- (void)goHome:(UIButton*)sender{
    GLUserHomePageViewController* homeVC=[[GLUserHomePageViewController alloc] initWithUserID:@""];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:homeVC animated:YES];
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
