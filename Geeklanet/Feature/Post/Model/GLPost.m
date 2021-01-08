//
//  GLPost.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPost.h"

@implementation GLPost

- (instancetype)init{
    if(self = [super init]){
        self.title=@"震惊！美国疫情竟在2020年突破2000万大关！";
        self.dataList=[[NSMutableArray alloc] init];
        self.type=@"分享";
        self.tags=[[NSMutableArray alloc] init];
        [self.tags addObject:@"Python"];
        [self.tags addObject:@"Java"];
        [self.tags addObject:@""];
        int tmp=rand()%5;
        tmp++;
        for(int i=0;i<tmp;i++){
            GLComment* comment=[[GLComment alloc] init];
            [self.dataList addObject:comment];
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
