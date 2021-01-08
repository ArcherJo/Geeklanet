//
//  GLNoticeManager.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLNoticeManager.h"

@implementation GLNoticeManager

- (instancetype)init{
    if(self = [super init]){

    }
    return self;
}



+ (NSMutableArray*)getUnreadNotice{
    NSMutableDictionary* dic = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeLike],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"今天来电竟然晚了好几分钟，发生甚么事了？",
                                 @"commentContent":@"用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？",
                                 @"subCommentContent":@"",
                                 @"hasRead":@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":@1,
                                 };
    NSMutableDictionary* dic2 = @{
                                  @"noticeID":@"",
                                  @"type":[NSNumber numberWithInt:NoticeTypeSubComment],
                                  @"sponsorID":@"",
                                  @"recipientID":@"",
                                  @"postID":@"",
                                  @"commentID":@"",
                                  @"subCommentID":@"",
                                  
                                  @"postTitle":@"为什么我还在写作业啊？",
                                  @"commentContent":@"iOS yyds!!!",
                                  @"subCommentContent":@"UItableView yyds!!!",
                                  @"hasRead":@0,
                                  @"timeStampUnix":@"2020-01-01",
                                  @"sponsorName":@"smilyt",
                                  
                                  @"avatra":[UIImage imageNamed:@"smilyt"],
                                  @"postImage":[UIImage imageNamed:@"smilyt"],
                                  @"haveImage":@1,
                                  };
    
    NSMutableDictionary* dic3 = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeFollow],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"",
                                 @"commentContent":@"",
                                 @"subCommentContent":@"",
                                 @"hasRead":@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage alloc],
                                 @"haveImage":@0,
                                 };
    
    NSMutableDictionary* dic4 = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeCallInComment],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"为什么我还在写作业啊？",
                                 @"commentContent":@"@smilyt 你写完了么？",
                                 @"subCommentContent":@"",
                                 @"hasRead":@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":rand()%2==1?@1:@0,
                                 };
    
    NSMutableArray* a =[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        int tmp=rand()%4;
        if (tmp==0)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic]];
        else if (tmp==1)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic2]];
        else if (tmp==2)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic3]];
        else if (tmp==3)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic4]];
    }
    return a;
}



+ (NSMutableArray*)getLikeNotice{
    NSMutableDictionary* dic = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeLike],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"今天来电竟然晚了好几分钟，发生甚么事了？",
                                 @"commentContent":@"用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？用爱发电吗？",
                                 @"subCommentContent":@"",
                                 @"hasRead":rand()%2==1?@1:@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":rand()%2==1?@1:@0,
                                 };
    NSMutableArray* a =[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        [a addObject:[[GLNotice alloc] initWithDictionary:dic]];
    }
    return a;
    
    
}



+ (NSMutableArray*)getReplyNotice{
    NSMutableDictionary* dic = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeComment],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"为什么我还在写作业啊？",
                                 @"commentContent":@"iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！",
                                 @"subCommentContent":@"",
                                 @"hasRead":rand()%2==1?@1:@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":rand()%2==1?@1:@0,
                                 };
    
    
    NSMutableDictionary* dic2 = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeSubComment],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"为什么我还在写作业啊？",
                                 @"commentContent":@"iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！iOS 永远的神!!!来世还要iOS！！！",
                                 @"subCommentContent":@"UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!UITableView yyds!!!",
                                 @"hasRead":rand()%2==1?@1:@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":rand()%2==1?@1:@0,
                                 };
    NSMutableArray* a =[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        int tmp=rand()%2;
        if (tmp==0)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic]];
        else
            [a addObject:[[GLNotice alloc] initWithDictionary:dic2]];
    }
    return a;
    
}



+ (NSMutableArray*)getCallNotice{
    NSMutableDictionary* dic = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeCallInComment],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"为什么我还在写作业啊？",
                                 @"commentContent":@"@smilyt 你写完了么？",
                                 @"subCommentContent":@"",
                                 @"hasRead":rand()%2==1?@1:@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"haveImage":rand()%2==1?@1:@0,
                                 };
    
    NSMutableDictionary* dic2 = @{
                                 @"noticeID":@"",
                                 @"type":[NSNumber numberWithInt:NoticeTypeCallInSubComment],
                                 @"sponsorID":@"",
                                 @"recipientID":@"",
                                 @"postID":@"",
                                 @"commentID":@"",
                                 @"subCommentID":@"",
                                 
                                 @"postTitle":@"为什么我还在写作业啊？",
                                 @"commentContent":@"iOS yyds!!!",
                                 @"subCommentContent":@"@smilt 确实",
                                 @"hasRead":rand()%2==1?@1:@0,
                                 @"timeStampUnix":@"2020-01-01",
                                 @"sponsorName":@"smilyt",
                                 
                                 @"avatra":[UIImage imageNamed:@"smilyt"],
                                 @"postImage":[UIImage imageNamed:@"smilyt"],
                                 @"havaImage":rand()%2==1?@1:@0,
                                 };
    NSMutableArray* a =[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        int tmp=rand()%2;
        if (tmp==0)
            [a addObject:[[GLNotice alloc] initWithDictionary:dic]];
        else
            [a addObject:[[GLNotice alloc] initWithDictionary:dic2]];
    }
    return a;
    
}


+ (NSMutableArray*)getFollowNotice{
    NSMutableDictionary* dic = @{
                                  @"noticeID":@"",
                                  @"type":[NSNumber numberWithInt:NoticeTypeFollow],
                                  @"sponsorID":@"",
                                  @"recipientID":@"",
                                  @"postID":@"",
                                  @"commentID":@"",
                                  @"subCommentID":@"",
                                  
                                  @"postTitle":@"",
                                  @"commentContent":@"",
                                  @"subCommentContent":@"",
                                  @"hasRead":rand()%2==1?@1:@0,
                                  @"timeStampUnix":@"2020-01-01",
                                  @"sponsorName":@"smilyt",
                                  
                                  @"avatra":[UIImage imageNamed:@"smilyt"],
                                  @"postImage":[UIImage alloc],
                                  @"haveImage":@0,
                                  };
    
    NSMutableArray* a =[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++)
        [a addObject:[[GLNotice alloc] initWithDictionary:dic]];
    
    return a;
}
@end
