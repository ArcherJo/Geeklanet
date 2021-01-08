//
//  GLUserBaseInfo.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/4.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserBaseInfo.h"

@implementation GLUserBaseInfo

-(instancetype)initWith:(NSDictionary*)dic{
    if (self = [super init]){
        self.avatra=dic[@"avatra"];
        self.userName=dic[@"userName"];
        self.userTitle=dic[@"userTitle"];
        self.level=dic[@"level"];
        self.gender=dic[@"gender"];
    }
    
    return self;
}

@end
