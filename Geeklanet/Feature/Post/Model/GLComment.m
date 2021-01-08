//
//  GLComment.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLComment.h"

@implementation GLComment

- (instancetype)init{
    if(self = [super init]){
        self.avatra=[UIImage imageNamed:@"smilyt"];
        self.gender=[UIImage imageNamed:@"boy"];
        self.name=@"smilyt";
        self.title=@"Python萌新";
        self.time=@"2020-01-02";
        self.content=@"2021年都要学习新年贺词精神！奥利给！兄弟们期末考试加油！2021年都要学习新年贺词精神！奥利给！兄弟们期末考试加油！2021年都要学习新年贺词精神！奥利给！兄弟们期末考试加油！2021年都要学习新年贺词精神！奥利给！兄弟们期末考试加油！";
        self.level=2;
        self.one=2;
        self.two=15;
        self.three=1;
        self.likeNum=4950;
        self.dataList=[[NSMutableArray alloc] init];
        self.pictures=[[NSMutableArray alloc] init];
        int tmp=rand()%5;
        for(int i=0;i<tmp;i++){
            GLSubComment* sub=[[GLSubComment alloc] init];
            [self.dataList addObject:sub];
        }
        
        tmp=rand()%10;
        for(int i=0;i<tmp;i++){
            UIImage* picture=[UIImage imageNamed:@"smilyt"];
            [self.pictures addObject:picture];
        }
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dic{
    if(self = [super init]){
        
    }
    return self;
}

@end
