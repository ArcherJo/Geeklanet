//
//  GLNotice.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/7.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLNotice : NSObject

typedef enum _NoticeType {
    NoticeTypeFollow = 0,
    NoticeTypeLike,
    NoticeTypeDislike,
    NoticeTypeComment,
    NoticeTypeSubComment,
    NoticeTypeCallInComment,
    NoticeTypeCallInSubComment,
} NoticeType;


@property (nonatomic) NSString* ID;
@property (nonatomic) NoticeType type;
@property (nonatomic) NSString* sponsorID;
@property (nonatomic) NSString* recipientID;
@property (nonatomic) NSString* postID;
@property (nonatomic) NSString* commentID;
@property (nonatomic) NSString* subCommentID;
@property (nonatomic) NSString* postTitle;
@property (nonatomic) NSString* commentContent;
@property (nonatomic) NSString* subCommentContent;
@property (nonatomic) NSNumber* hasRead;
@property (nonatomic) NSString* timeStamp;

@property (nonatomic) NSString* sponsorName;
@property (strong,nonatomic) UIImage* avatra;
@property (strong,nonatomic) UIImage* postImage;
@property (nonatomic) NSNumber* haveImage;

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
