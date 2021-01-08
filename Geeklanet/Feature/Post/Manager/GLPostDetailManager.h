//
//  GLPostDetailManager.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/3.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../../Network/GLPostAPI.h"
#import "../Model/GLPost.h"

NS_ASSUME_NONNULL_BEGIN


@interface GLPostDetailManager : NSObject

@property (nonatomic) GLPost* post;

- (instancetype)initWithPostID:(NSString*)postID;

@end

NS_ASSUME_NONNULL_END
