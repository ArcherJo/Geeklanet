//
//  GLUserManager.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/31.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserManager.h"

@implementation GLUserManager


+ (GLUserBaseInfo*)getBaseInfoBy:(NSString*)userID{
    NSMutableDictionary *baseInfoDic=[[NSMutableDictionary alloc] init];
    [baseInfoDic setValue:[UIImage imageNamed:@"smilyt"] forKey:@"avatra"];
    [baseInfoDic setValue:@"smilyt" forKey:@"userName"];
    [baseInfoDic setValue:@"oc高手" forKey:@"userTitle"];
    [baseInfoDic setValue:@3 forKey:@"level"];
    [baseInfoDic setValue:@1 forKey:@"gender"];
    
    //NSMutableDictionary *baseInfoDic2 = [GLUserAPI getBaseInfoBy:userID];
    
    return [[GLUserBaseInfo alloc] initWith:baseInfoDic];
}

+ (GLUserInfo*)getInfoBy:(NSString*)userID{
    
    NSMutableDictionary *infoDic=[[NSMutableDictionary alloc] init];
    [infoDic setValue:[UIImage imageNamed:@"smilyt"] forKey:@"avatra"];
    [infoDic setValue:@"smilyt" forKey:@"userName"];
    [infoDic setValue:@"oc高手" forKey:@"userTitle"];
    [infoDic setValue:@2 forKey:@"level"];
    [infoDic setValue:@0 forKey:@"gender"];
    [infoDic setValue:@2 forKey:@"golden"];
    [infoDic setValue:@10 forKey:@"silver"];
    [infoDic setValue:@1 forKey:@"bronze"];
    [infoDic setValue:@20 forKey:@"followsCount"];
    [infoDic setValue:@1 forKey:@"fansCount"];
    [infoDic setValue:@4950 forKey:@"likeCount"];
    
    return [[GLUserInfo alloc] initWith:infoDic];
}

+ (NSMutableArray*)getFollowsBaseInfoBy:(NSString*)userID{
    NSMutableArray *userBaseInfos = [[NSMutableArray alloc] init];
    
    for(int i=0;i<10;i++){
        NSMutableDictionary *baseInfoDic=[[NSMutableDictionary alloc] init];
        [baseInfoDic setValue:[UIImage imageNamed:@"smilyt"] forKey:@"avatra"];
        [baseInfoDic setValue:@"smilyt" forKey:@"userName"];
        [baseInfoDic setValue:@"oc高手" forKey:@"userTitle"];
        [baseInfoDic setValue:@3 forKey:@"level"];
        [baseInfoDic setValue:@1 forKey:@"gender"];
        
        [userBaseInfos addObject:[[GLUserBaseInfo alloc] initWith:baseInfoDic]];
    }
    
    return userBaseInfos;
    
}

+ (NSMutableArray*)getFansBaseInfoBy:(NSString*)userID{
    NSMutableArray *userBaseInfos = [[NSMutableArray alloc] init];
    
    for(int i=0;i<10;i++){
        NSMutableDictionary *baseInfoDic=[[NSMutableDictionary alloc] init];
        [baseInfoDic setValue:[UIImage imageNamed:@"smilyt"] forKey:@"avatra"];
        [baseInfoDic setValue:@"smilyt" forKey:@"userName"];
        [baseInfoDic setValue:@"oc高手" forKey:@"userTitle"];
        [baseInfoDic setValue:@3 forKey:@"level"];
        [baseInfoDic setValue:@1 forKey:@"gender"];
        
        [userBaseInfos addObject:[[GLUserBaseInfo alloc] initWith:baseInfoDic]];
    }
    
    return userBaseInfos;
}


@end
