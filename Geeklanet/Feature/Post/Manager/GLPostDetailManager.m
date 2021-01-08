//
//  GLPostDetailManager.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostDetailManager.h"

@implementation GLPostDetailManager

- (instancetype)init{
    if(self = [super init]){
        GLPost* post=[[GLPost alloc] init];
        self.post=post;
    }
    return self;
}

- (instancetype)initWithPostID:(NSString*)postID{
    if(self = [super init]){
        
    }
    return self;
}

@end
