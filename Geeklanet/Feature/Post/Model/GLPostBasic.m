//
//  GLPostBasic.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/2.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostBasic.h"

@implementation GLPostBasic

- (instancetype)init{
    if(self = [super init]){
        int tmp;
        self.tags=[[NSMutableArray alloc] init];
        tmp=rand()%2;
        if (tmp == 1)
            [self.tags addObject:@"Python"];
        else
            [self.tags addObject:@"Java"];
        tmp=rand()%2;
        if (tmp == 1)
            [self.tags addObject:@"OC"];
        else
            [self.tags addObject:@"Golang"];
        [self.tags addObject:@""];
        self.avatra=[UIImage imageNamed:@"smilyt"];
        self.gender=[UIImage imageNamed:@"boy"];
        self.name=@"smilyt";
        
        tmp=rand()%4;
        switch (tmp) {
            case 0:
                self.userTitle=@"Python萌新";
                break;
            case 1:
                self.userTitle=@"Java健将";
                break;
            case 2:
                self.userTitle=@"OC专家";
                break;
            case 3:
                self.userTitle=@"Golang巨佬";
                break;
            default:
                break;
        }
        self.time=@"2020-01-02";
        self.level=2;
        self.one=28;
        self.two=10;
        self.three=1;
        self.likeNum=450;
        self.commentNum=54;
        tmp=rand()%2;
        self.picture=[UIImage imageNamed:@"smilyt"];
        if(tmp == 0) self.havePic=NO;
        else self.havePic=YES;
        
        tmp=rand()%3;
        if(tmp == 0){
            self.title=@"震惊！某Bug竟然没有任何提示信息！";
            self.type=@"求助";
            self.content=@"救救孩子吧！一个突然出现的Bug，xCode也没有任何提示信息，眼睛快看花了，求求大神帮帮忙吧！！";
        }else if (tmp == 1){
            self.title=@"不看后悔！UITableView还有这种操作！";
            self.type=@"分享";
            self.content=@"在有些时候出现莫名原因的内容加载不完全，如果实在做不出来，可以用tableview.contentInset手动微调～";
        }else{
            self.title=@"男默女泪！ios作业太多！";
            self.type=@"日常";
            self.content=@"是什么，让一个正值花样年华的少年，在广东寒冷的冬夜，通宵写作业一周？是的，正是那令人窒息的iOS！";
        }
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic{
    if(self = [super init]){
        
    }
    return self;
}

@end
