//
//  GLUserManager.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/31.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Model/GLUserInfo.h"
#import "../Model/GLUserBaseInfo.h"
#import "../../../Network/GLUserAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserManager : NSObject

+ (GLUserBaseInfo*)getBaseInfoBy:(NSString*)userID;
+ (GLUserInfo*)getInfoBy:(NSString*)userID;

+ (NSMutableArray*)getFollowsBaseInfoBy:(NSString*)userID;
+ (NSMutableArray*)getFansBaseInfoBy:(NSString*)userID;


@end

NS_ASSUME_NONNULL_END
