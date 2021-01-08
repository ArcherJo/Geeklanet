//
//  GLUserConfigurator.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserConfigurator.h"

@implementation GLUserConfigurator

+ (int)getAvatraSize{
    return 100;
}

+ (int)getLevelCornerRadius{
    return 10;
}

+ (UIFont*)getButtonFont{
    return [UIFont systemFontOfSize:18.0];
}

+ (int)getHomeAttenButtonHeight{
    return 40;
}

+ (NSString*)getURL{
    return [[super getURL] stringByAppendingString:@"/user"];
}

+ (int)getUserAeraCornerRadius{
    return 15;
}

+ (UIFont*)getUserAeraFont{
    return [UIFont systemFontOfSize:16];
}

@end
