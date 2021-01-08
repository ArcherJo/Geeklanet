//
//  GLPost.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLPost : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* type;
@property (nonatomic) NSMutableArray* tags;
@property (nonatomic) NSMutableArray* dataList;

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
