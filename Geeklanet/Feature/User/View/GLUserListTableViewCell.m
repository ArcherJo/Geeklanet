//
//  GLFriendTableViewCell.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserListTableViewCell.h"

@interface GLUserListTableViewCell()

@property(strong,nonatomic) UIImageView* genderTip;
@property(strong,nonatomic) UIImageView* avatra;
@property(strong,nonatomic) UILabel* userName;
@property(strong,nonatomic) UILabel* userTitle;

@end

@implementation GLUserListTableViewCell

//- (instancetype)initWithFriendInfo:(GLFriendInfo*)info{
//    if(self = [super init]){
//        self.avatra=[[UIImageView alloc] init];
//        self.avatra.image=[GLUserManager getAvatraByStr:info.avatra];
//        self.avatra.frame=CGRectMake(20, 5, 60, 60);
//        self.avatra.layer.cornerRadius=30;
//        self.avatra.layer.masksToBounds=YES;
//        self.name.text=info.userName;
//        self.title.text=info.userTitle;
//        if(info.level==1){
//            self.title.textColor=[GLGlobalConfigurator getLevelOneColor];
//        }else if(info.level==2){
//            self.title.textColor=[GLGlobalConfigurator getLevelTwoColor];
//        }else if(info.level==3){
//            self.title.textColor=[GLGlobalConfigurator getLevelThreeColor];
//        }
//
//        self.genderTip=[[UIImageView alloc] init];
//        if(info.gender==1){
//            self.genderTip.image=[UIImage imageNamed:@"boy"];
//        }else{
//            self.genderTip.image=[UIImage imageNamed:@"girl"];
//        }
//        self.genderTip.frame=CGRectMake(50, 10, 10, 10);
//        [self.contentView addSubview:self.avatra];
//        [self.contentView addSubview:self.genderTip];
//        [self.contentView addSubview:self.name];
//        [self.contentView addSubview:self.title];
//    }
//    return self;
//}

- (instancetype)initWithUserBaseInfo:(GLUserBaseInfo*)baseInfo{
    if(self = [super init]){
        self.avatra=[[UIImageView alloc] init];
        self.avatra.image=baseInfo.avatra;
        self.avatra.layer.cornerRadius=30;
        self.avatra.layer.masksToBounds=YES;
        
        self.userName=[[UILabel alloc] init];
        self.userName.text=baseInfo.userName;
        self.userName.textAlignment=NSTextAlignmentLeft;
        
        self.userTitle=[[UILabel alloc] init];
        self.userTitle.text=baseInfo.userTitle;
        self.userTitle.textAlignment=NSTextAlignmentLeft;
        self.userTitle.textColor=[GLUserConfigurator getColorByLevel:[baseInfo.level intValue]];
        
        self.genderTip=[[UIImageView alloc] init];
        self.genderTip.image = [baseInfo.gender intValue]==1 ? [UIImage imageNamed:@"boy"]: [UIImage imageNamed:@"girl"];
        
        self.avatra.frame=CGRectMake(20, 5, 60, 60);
        self.userName.frame=CGRectMake(90, 5, 100, 40);
        self.userTitle.frame=CGRectMake(90, 35, 100, 30);
        self.genderTip.frame=CGRectMake(150, 15, 20, 20);
        
        [self.contentView addSubview:self.avatra];
        [self.contentView addSubview:self.genderTip];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userTitle];
    }
    return self;
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
