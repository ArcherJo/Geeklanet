//
//  GLGlobalConfigurator.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLGlobalConfigurator.h"

@implementation GLGlobalConfigurator

+ (UIColor*)getColorByLevel:(int)level{
    if(level == 1) return [self getLevelOneColor];
    else if(level == 2) return [self getLevelTwoColor];
    else if(level == 3) return [self getLevelThreeColor];
    else return UIColor.clearColor;
}

+ (UIColor*)getLevelThreeColor{
    return UIColorFromHex(0xFDB322);
}
+ (UIColor*)getLevelTwoColor{
    return UIColorFromHex(0x9B9AA0);
}
+ (UIColor*)getLevelOneColor{
    return UIColorFromHex(0xEF8155);
}

+ (UIColor*)getTimeStampColor{
    return UIColor.grayColor;
}

+ (UIColor*)getNavColor{
    return UIColorFromHex(0x79D6F7);
}

+ (CGFloat)getNavHeight{
    return 90;
}

+ (CGFloat)getNavContentHeight{
    return 40;
}


+ (CGSize)getNavButtonSize{
    return CGSizeMake([self getNavContentHeight]+20, [self getNavContentHeight]);
}

+ (NSString*)getURL{
    return @"http://localhost";
}
+ (UIColor*)getFollowButtonColor{
    return UIColorFromHex(0x0096FF);
}

@end
