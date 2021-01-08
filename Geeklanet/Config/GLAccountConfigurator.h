//
//  GLAccountConfigurator.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLGlobalConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLAccountConfigurator : GLGlobalConfigurator

+ (int)getAppIconRadiusSignIn;
+ (int)getAppIconRadiusSignUp;

+ (int)getButtonCornerRadius;
+ (int)getButtonBorderWidth;
+ (int)getGoButtonCornerRadius;
+ (int)getGoButtonBorderWidth;

@end

NS_ASSUME_NONNULL_END
