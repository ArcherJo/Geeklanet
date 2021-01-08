//
//  GLUserConfigurator.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLGlobalConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserConfigurator : GLGlobalConfigurator

+ (int)getAvatraSize;

+ (int)getLevelCornerRadius;

+ (UIFont*)getButtonFont;

+ (int)getHomeAttenButtonHeight;

+ (int)getUserAeraCornerRadius;

+ (UIFont*)getUserAeraFont;
    
@end

NS_ASSUME_NONNULL_END
