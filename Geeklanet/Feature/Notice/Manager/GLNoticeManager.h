//
//  GLNoticeManager.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../../Network/GLNoticeAPI.h"
#import "../Model/GLNotice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNoticeManager : NSObject

+ (NSMutableArray*)getUnreadNotice;
+ (NSMutableArray*)getLikeNotice;
+ (NSMutableArray*)getReplyNotice;
+ (NSMutableArray*)getCallNotice;
+ (NSMutableArray*)getFollowNotice;

@end

NS_ASSUME_NONNULL_END
