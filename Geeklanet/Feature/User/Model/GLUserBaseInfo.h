//
//  GLUserBaseInfo.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/4.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLUserBaseInfo : NSObject

@property (nonatomic, strong)UIImage *avatra;
@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *userTitle;
@property (nonatomic, strong)NSNumber *level;
@property (nonatomic, strong)NSNumber *gender;

-(instancetype)initWith:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
