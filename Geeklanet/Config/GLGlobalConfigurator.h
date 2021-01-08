//
//  GLGlobalConfigurator.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define UIColorFromHex(s)  [UIColor colorWithRed:(((s &0xFF0000) >>16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

NS_ASSUME_NONNULL_BEGIN

@interface GLGlobalConfigurator : NSObject

+ (UIColor*)getColorByLevel:(int)level;
+ (UIColor*)getLevelThreeColor;
+ (UIColor*)getLevelTwoColor;
+ (UIColor*)getLevelOneColor;
+ (UIColor*)getTimeStampColor;
+ (NSString*)getURL;
+ (UIColor*)getNavColor;
+ (CGFloat)getNavHeight;
+ (CGFloat)getNavContentHeight;
+ (CGSize)getNavButtonSize;
+ (UIColor*)getFollowButtonColor;

@end

NS_ASSUME_NONNULL_END
