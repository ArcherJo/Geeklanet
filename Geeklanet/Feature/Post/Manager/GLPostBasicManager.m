//
//  GLPostBasicManager.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostBasicManager.h"

@implementation GLPostBasicManager

- (instancetype)init{
    if(self = [super init]){
        self.dataList=[[NSMutableArray alloc] init];
        int cnt = rand()%12;
        for(int i=0;i<cnt;i++){
            GLPostBasic* post=[[GLPostBasic alloc] init];
            [self.dataList addObject:post];
        }
    }
    return self;
}

- (instancetype)initWithURL:(NSString*)urlStr{
    if(self = [super init]){
        
    }
    return self;
}

@end
