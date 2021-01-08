
//
//  GLNoticeTableViewCell.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/7.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLNoticeTableViewCell.h"

@interface GLNoticeTableViewCell ()


@property (strong,nonatomic) UIButton* avatra;
@property (strong,nonatomic) UILabel* sponsorName;
@property (strong,nonatomic) UILabel* time;
@property (strong,nonatomic) UILabel *dot;


@property (strong,nonatomic) UILabel* noticeContent;
@property (strong,nonatomic) UILabel* subCommentContent;
@property (strong,nonatomic) UILabel* commentContent;

@property (strong,nonatomic) UILabel* line;

@property (strong,nonatomic) UILabel* postTitle;
@property (strong,nonatomic) UIImageView* postImage;
@property (strong,nonatomic) UILabel* postContentBack;

@end


@implementation GLNoticeTableViewCell


- (instancetype)initWithNotice:(GLNotice*)notice{
    if(self = [super init]){
        self.data = notice;
        [self layoutSubview];
        

    }
    return self;
}


- (void)layoutSubview{
    BOOL flag = true;
    self.avatra.frame=CGRectMake(20, 20, 60, 60);
    self.sponsorName.frame=CGRectMake(90, 20, 100, 35);
    self.time.frame=CGRectMake(90, 55, 100, 25);
    //if ([self.data.hasRead intValue]==0){
    if (rand()%2==0){
        self.dot.frame = CGRectMake(380, 30, 10, 10);
        self.dot.layer.masksToBounds = YES;
        self.dot.layer.cornerRadius=5;
        
        [self.contentView addSubview:self.dot];
    }
    
    [self.contentView addSubview:self.avatra];
    [self.contentView addSubview:self.sponsorName];
    [self.contentView addSubview:self.time];
    
    self.height = 80;
    
    if (![self.noticeContent.text isEqual:@""]){
        self.height += 15;
        self.noticeContent.frame=CGRectMake(20, self.height, 380, 30);
        self.height += 30;
        flag = false;
        
        [self.contentView addSubview:self.noticeContent];
    }
    
    if (![self.subCommentContent.text isEqual:@""]){
        self.height += 10;
        if (!flag){
            self.line.frame=CGRectMake(20, self.height, 380, 2);
            self.height+=2;
            
            self.height+=5;
            
            [self.contentView addSubview:self.line];
        }
        
        self.subCommentContent.frame = CGRectMake(20, self.height, 380, 0);
        [Utilites dynamicCalculateLabelHight:self.subCommentContent maxLine:2];
        self.height+=self.subCommentContent.frame.size.height;
        flag=false;
        
        [self.contentView addSubview:self.subCommentContent];
    }
    
    if (![self.commentContent.text isEqual:@""]){
        self.height += 10;
        if (!flag){
            self.line.frame=CGRectMake(20, self.height, 380, 2);
            self.height+=2;
            self.height+=5;
            [self.contentView addSubview:self.line];
        }
        
        self.commentContent.frame = CGRectMake(20, self.height, 380, 0);
        [Utilites dynamicCalculateLabelHight:self.commentContent maxLine:2];
        self.height+=self.commentContent.frame.size.height;
        [self.contentView addSubview:self.commentContent];
    }
    
    if (self.data.type!=NoticeTypeFollow){
        self.height+=10;
        
        self.postContentBack.layer.masksToBounds=YES;
        self.postContentBack.layer.cornerRadius=[GLNoticeConfigurator getGrayAeraCornerRadius];
        self.postContentBack.frame=CGRectMake(20, self.height, 380, 80);
        [self.contentView addSubview:self.postContentBack];
        
        if (self.data.haveImage){
            self.postImage.layer.masksToBounds = YES;
            self.postImage.layer.cornerRadius=[GLNoticeConfigurator getGrayAeraCornerRadius];
            self.postImage.frame=CGRectMake(25, self.height+5, 70, 70);
            self.postTitle.frame=CGRectMake(110, self.height+10, 260, 60);
            [self.contentView addSubview:self.postImage];
        }else{
            self.postTitle.frame=CGRectMake(30, self.height+10, 350, 60);
        }
        [self.contentView addSubview:self.postTitle];
        
        self.height+=80;
    }
    
    
    self.height += 20;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(UIButton*) avatra{
    if (_avatra==nil){
        _avatra = [[UIButton alloc]init];
        [_avatra setBackgroundImage:self.data.avatra forState:UIControlStateNormal];
        _avatra.layer.cornerRadius=[GLNoticeConfigurator getCellAvatraWidth]/2;
        _avatra.layer.masksToBounds=YES;
        [_avatra addTarget:self action:@selector(goHome:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _avatra;
}

-(UILabel*) sponsorName{
    if (_sponsorName==nil){
        _sponsorName = [[UILabel alloc]init];
        _sponsorName.text=self.data.sponsorName;
        _sponsorName.textAlignment=NSTextAlignmentLeft;
        _sponsorName.font=[UIFont systemFontOfSize:25];
    }
    return _sponsorName;
}

-(UILabel*) time{
    if (_time==nil){
        _time= [[UILabel alloc]init];
        _time.text=self.data.timeStamp;
        _time.textAlignment=NSTextAlignmentLeft;
        _time.font=[UIFont systemFontOfSize:16];
        _time.textColor=[GLNoticeConfigurator getTimeStampColor];
    }
    return _time;
}

-(UILabel*)dot{
    if(_dot==nil){
        _dot=[[UILabel alloc]init];
        _dot.backgroundColor = [UIColor redColor];
    }
    return _dot;
}



-(UILabel*) noticeContent{
    if (_noticeContent==nil){
        _noticeContent = [[UILabel alloc]init];
        
        switch (self.data.type) {
            case NoticeTypeFollow:
                _noticeContent.text = @"关注了你";
                break;
            case NoticeTypeLike:
                _noticeContent.text = @"赞了你的评论";
                break;
            case NoticeTypeDislike:
                _noticeContent.text = @"踩了你的评论";
                break;
            case NoticeTypeCallInComment:
                _noticeContent.text = @"在评论中提到了你";
                break;
            case NoticeTypeCallInSubComment:
                _noticeContent.text = @"在回复中提到了你";
                break;
            default:
                _noticeContent.text = @"";
                break;
        }
        _noticeContent.font=[UIFont systemFontOfSize:20];
        
    }
    return _noticeContent;
}



-(UILabel*) subCommentContent{
    if (_subCommentContent==nil){
        _subCommentContent = [[UILabel alloc]init];
        _subCommentContent.text = self.data.subCommentContent;
        _subCommentContent.numberOfLines = 0;
        if (self.data.type == NoticeTypeSubComment){
            _subCommentContent.font = [UIFont systemFontOfSize:20];
        } else {
            _subCommentContent.font = [UIFont systemFontOfSize:18];
            _subCommentContent.textColor = UIColorFromHex(0x47474A);
        }
    }
    return _subCommentContent;
}

-(UILabel*) commentContent{
    if (_commentContent==nil){
        _commentContent = [[UILabel alloc]init];
        _commentContent.numberOfLines = 0;
        if (self.data.type == NoticeTypeCallInSubComment) {
            _commentContent.text = @"";
        }else {
            _commentContent.text = self.data.commentContent;
            if (self.data.type == NoticeTypeComment){
                _commentContent.font = [UIFont systemFontOfSize:20];
            }else{
                _commentContent.font = [UIFont systemFontOfSize:18];
                _commentContent.textColor = UIColorFromHex(0x47474A);
            }
        }
        
    }
    return _commentContent;
}



-(UILabel*) line{
    if (_line==nil){
        _line = [[UILabel alloc]init];
        _line.backgroundColor=UIColorFromHex(0xF5F5F9);
    }
    return _line;
}


-(UILabel*) postTitle{
    if (_postTitle==nil){
        _postTitle= [[UILabel alloc]init];
        _postTitle.text = self.data.postTitle;
        _postTitle.textColor=UIColorFromHex(0x47474A);
        _postTitle.font=[UIFont systemFontOfSize:18];
        _postTitle.numberOfLines=2;
        
    }
    return _postTitle;
}


-(UIImageView*) postImage{
    if (_postImage==nil){
        _postImage = [[UIImageView alloc]init];
        _postImage.image = self.data.postImage;
    }
    return _postImage;
}

-(UILabel*) postContentBack{
    if (_postContentBack==nil){
        _postContentBack = [[UILabel alloc]init];
        _postContentBack.backgroundColor=UIColorFromHex(0xF5F5F9);
    }
    return _postContentBack;
}

#pragma mark -response

- (void)goHome:(UIButton*)sender{
    GLUserHomePageViewController* homeVC=[[GLUserHomePageViewController alloc] initWithUserID:@""];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:homeVC animated:YES];
}

@end
