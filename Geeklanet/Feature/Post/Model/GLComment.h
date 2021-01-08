//
//  GLComment.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GLSubComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLComment : NSObject

@property (nonatomic) UIImage* avatra;
@property (nonatomic) UIImage* gender;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* time;
@property (nonatomic) NSString* content;
@property (nonatomic) int level;
@property (nonatomic) int one;
@property (nonatomic) int two;
@property (nonatomic) int three;
@property (nonatomic) int likeNum;
@property (nonatomic) NSMutableArray* pictures;
@property (nonatomic) NSMutableArray* dataList;

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
