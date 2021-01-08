//
//  GLUserAPI.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLAPI.h"
#import "../Config/GLUserConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserAPI : NSObject

+(NSMutableDictionary*)getBaseInfoBy:(NSString*)userID;

@end

NS_ASSUME_NONNULL_END
