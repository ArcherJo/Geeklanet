//
//  GLUserInfo.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/4.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserInfo.h"

@implementation GLUserInfo

-(instancetype)initWith:(NSDictionary*)dic{
    if (self = [super init]){
        _avatra=dic[@"avatra"];
        _userName=dic[@"userName"];
        _userTitle=dic[@"userTitle"];
        _level=dic[@"level"];
        _gender=dic[@"gender"];
        _golden=dic[@"golden"];
        _silver=dic[@"silver"];
        _bronze=dic[@"bronze"];
        _followsCount=dic[@"followsCount"];
        _fansCount=dic[@"fansCount"];
        _likeCount=dic[@"likeCount"];
    }
    
    return self;
}

@end
