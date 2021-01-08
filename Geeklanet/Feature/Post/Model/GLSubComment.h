//
//  GLSubComment.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLSubComment : NSObject

@property (nonatomic) NSString* userName;
@property (nonatomic) NSString* timeStamp;
@property (nonatomic) NSString* content;

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
