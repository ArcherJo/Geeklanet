

//
//  GLSubComment.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLSubComment.h"

@implementation GLSubComment

- (instancetype)init{
    if(self = [super init]){
        self.content=@"今天是一月二号，虽然放假了，但是也在学习，呜呜呜，什么时候作业才能写完啊";
        self.userName=@"smilyt";
        self.timeStamp=@"2020-01-02";
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic{
    if(self = [super init]){
        
    }
    return self;
}

@end
