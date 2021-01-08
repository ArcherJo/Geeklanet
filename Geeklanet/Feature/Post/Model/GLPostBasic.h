//
//  GLPostBasic.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/2.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLPostBasic : NSObject

@property (nonatomic) UIImage* avatra;
@property (nonatomic) UIImage* gender;
@property (nonatomic) UIImage* picture;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* type;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* userTitle;
@property (nonatomic) NSString* time;
@property (nonatomic) NSString* content;
@property (nonatomic) int level;
@property (nonatomic) int one;
@property (nonatomic) int two;
@property (nonatomic) int three;
@property (nonatomic) int likeNum;
@property (nonatomic) int commentNum;
@property (nonatomic) BOOL havePic;
@property (nonatomic) NSMutableArray* tags;

- (instancetype)initWithDictionary:(NSMutableDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
