//
//  GLNotice.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/7.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLNotice.h"

@implementation GLNotice





- (instancetype)initWithDictionary:(NSMutableDictionary*)dic{
    if(self = [super init]){
        self.ID = dic[@"noticeID"];
        self.type = [dic[@"type"] intValue];
        self.sponsorID = dic[@"sponsorID"];
        self.recipientID = dic[@"recipientID"];
        self.postID = dic[@"postID"];
        self.commentID = dic[@"commentID"];
        self.subCommentID = dic[@"subCommentID"];
        self.postTitle = dic[@"postTitle"];
        self.commentContent = dic[@"commentContent"];
        self.subCommentContent = dic[@"subCommentContent"];
        self.hasRead = dic[@"hasRead"];
        self.timeStamp = dic[@"timeStampUnix"];
        
        self.sponsorName = dic[@"sponsorName"];
        self.avatra = dic[@"avatra"];
        self.postImage = dic[@"postImage"];
        self.haveImage = dic[@"haveImage"];
    }
    return self;
}

@end
